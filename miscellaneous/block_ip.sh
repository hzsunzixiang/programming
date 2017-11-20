#!/bin/bash
#Name: block_ip.sh
#Purpose: traffic and connections analysis , use iptables drop abnormal ip address
#
#Usage:
#
#Auther: RobertsHu
#
#Created: 19/09/2016
#Copyright: (c) RobertsHu 2016

eth=$1
# 连接数量最大限制
MAX_CONNECT_IP_NUM=$2
# 流量最大限制
MAX_NET_FLOW=$3
# 定义扫描的端口                                                                                                                                                   
CHK_PORT="$(echo "443" && echo {7101..7120} && echo "{7000..7004}" )"
# 常规日志记录
LOG_FILE="/tmp/.debug_$(basename $0).log"
# 封杀记录
DROP_IP_LOG="/tmp/.$(basename $0).log"
# 写入报警日志文件发送短信
MSGFILE="/dev/shm/MsgFile.txt"
# 获取网卡ip地址
IP_ADDR=$(ifconfig $eth|awk '/inet addr:/{print $2}'|awk -F":" '{print $2}'|head -n 1)
# 排除在外的ip,未精确到主机位
WHITE_IP=(1.1.1.0/8 2.2.2.0/8)
# 103.61.193.0/25
# 58.251.8.8/29
# 14.215.134.128/25 
# 103.251.131.0/28
# 112.121.138.64/29
#
# http://help.bitscn.com/ip/
#

# 核对参数是否齐全
if [[ $# -ne 3 ]]; then
    echo -e "/bin/sh $0 Device_name Max_connection_number[个] Max_Flow_number[Kb]"
    echo -e "Example: "
    echo -e "\t监控网卡eth0上单IP连接数超过180或流量超过200Kb/s,则用iptables封掉IP:"
    echo -e "\t/bin/sh $0 eth0 180 200"
    exit
else
    echo -e "\033[2;31;5m警告,请确认你的输入.网卡设备为:${eth},最大连接数阀值:$MAX_CONNECT_IP_NUM,每秒最大流量阀值:$MAX_NET_FLOW\033[0m"
    echo -en "\033[1;32;2mEnter yes or no to sure continue.[yes/no]:\033[0m"
    read Ikey
    echo 
    case $Ikey in
       yes)
         continue
         ;;
       no)
         echo "You cancel the operation."
         exit
         ;;
       *)
         echo "Please input 'yes' or 'no'"
         exit
         ;;
    esac
fi


# 根据IP_ADDR和CHK_PORT 生成数组
declare -a SIPANDPORT=()
SIPANDPORT_NUM=1
for port in $CHK_PORT; do
    SIPANDPORT[$SIPANDPORT_NUM]="${IP_ADDR}:${port}"
    SIPANDPORT_NUM=`expr $SIPANDPORT_NUM + 1` 
done


#安装tcpdump
if ! which tcpdump > /dev/null;then
    yum -y install tcpdump >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo -e "Command tcpdump install error,exit"
        exit
    fi
fi

#把带宽bit单位转换为人类可读单位
bit_to_human_readable(){
    #总带宽bit
    local trafficValue=$1
    #转换成Kb并取整数
    if [[ ${trafficValue%.*} -gt 922 ]];then
        trafficValue=`awk -v value=$trafficValue 'BEGIN{printf "%d",value/1024}'`
    else
        trafficValue=1
    fi
    echo $trafficValue
}

# IP封杀
Config_iptables(){
    CIP_ADDR=$1
    /sbin/iptables -I INPUT -s ${CIP_ADDR} -j DROP
}

# 检查超过流量阀值的IP
Net_traffic(){
    TMP_DUMPFILE="/tmp/tcpdump_temp"
    AWK_TMP_DUMPFILE="/tmp/tcpdump_temp2"
    TCP_DUMPFILE="/tmp/tcpdump"

    #tcpdump监听网络
    /usr/sbin/tcpdump -v -i $eth -tnn -p tcp and dst host $IP_ADDR > $TMP_DUMPFILE 2>&1 &
    sleep 10

    ps aux | grep tcpdump | grep -v grep | awk '{print $2}'|xargs --no-run-if-empty kill

    local regTcpdump=$(ifconfig | grep -A 1 $eth | awk -F'[: ]+' '$0~/inet addr:/{printf $4"|"}' | sed -e 's/|$//' -e 's/^/(/' -e 's/$/)\\\\\.[0-9]+:/')
  
    #新旧版本tcpdump输出格式不一样,分别处理
    if awk '/^IP/{print;exit}' $TMP_DUMPFILE | grep -q ")$";then
        #处理tcpdump文件
        awk '/^IP/{print;getline;print}' $TMP_DUMPFILE > $AWK_TMP_DUMPFILE
    else
        #处理tcpdump文件
        awk '/^IP/{print}' $TMP_DUMPFILE > $AWK_TMP_DUMPFILE
        sed -i -r 's#(.*: [0-9]+\))(.*)#\1\n    \2#' $AWK_TMP_DUMPFILE
    fi
    
    awk '{len=$NF;sub(/\)/,"",len);getline;print $0,len}' $AWK_TMP_DUMPFILE > $TCP_DUMPFILE

    #统计流量值前三的IP
    awk -F'[ .:]+' -v regTcpdump=$regTcpdump '{if ($0 ~ regTcpdump){line=$2"."$3"."$4"."$5" > "$8"."$9"."$10"."$11":"$12}else{line=$2"."$3"."$4"."$5":"$6" > "$8"."$9"."$10"."$11};sum[line]+=$NF*8/10}END{for (line in sum){printf "%s %d\n",line,sum[line]}}' $TCP_DUMPFILE | \
    sort -k 4 -nr | head -n 3 | while read a b c d;do
        SRC_CIP=$a
        DST_SIP_PORT=$c
        NETFLOW_SUM=$(bit_to_human_readable $d)
        # 判断IP是否在白名单中
        for white_ip in ${WHITE_IP[@]}; do
            if [[ "ip${SRC_CIP}" =~ "ip${white_ip}" ]] || [[ "ip${SRC_CIP}" == "ip${white_ip}" ]]; then
               NET_WHITE_RESULT="0"
               break 
            else
               NET_WHITE_RESULT="1"
               continue
            fi

        done

        # 判断流量是否超过阀值
        if [[ ${NETFLOW_SUM} -ge ${MAX_NET_FLOW} ]] && ! /sbin/iptables -L -vn| egrep -q "$SRC_CIP" && echo ${SIPANDPORT[@]}|egrep -q "DST_SIP_PORT" && [[ "${NET_WHITE_RESULT}t" == "1t" ]];then
            # 封杀IP
            Config_iptables $SRC_CIP
            # 报警并记录日志
            echo "$(date +'%Y-%m-%d-%H:%M:%S') $SRC_CIP to ${DST_SIP_PORT} traffic is ${NETFLOW_SUM}Kb/s over ${MAX_NET_FLOW}Kb/s." >> $DROP_IP_LOG
            echo "Warn $(date +'%Y-%m-%d-%H:%M:%S') 封杀${SRC_CIP}.到SVR端${DST_SIP_PORT}流量:${NETFLOW_SUM}Kb/s,阀值:${MAX_NET_FLOW}Kb/s." >> $MSGFILE
        else
            continue
        fi
        unset SRC_CIP DST_SIP_PORT NETFLOW_SUM NET_WHITE_RESULT
    done
}

# 检查超过连接阀值的IP
Port_connection(){
    TMP_CONNET_FILE="/tmp/tmp_ip_connet.txt"
    for pkey in ${SIPANDPORT[@]}; do
        # 获取指定server端口链接数
        CHEK_CONN_RESULT=$(/usr/sbin/ss -an|awk '!/^LISTEN/ && $4 == "'${pkey}'" {print $5}'|awk -F ':' '!/^192\.|^127\.|^172\.|^10\.|0.0.0.0/{print $1}'|sort|uniq -c |sort -k1n|tail -n 1)

        if [[ -z "$CHEK_CONN_RESULT" ]]; then
            continue
        else
            CONN_SUM=$(echo $CHEK_CONN_RESULT|awk '{print $1}')
            CONN_CIP=$(echo $CHEK_CONN_RESULT|awk '{print $2}')

            # 判断IP是否在白名单中
            for white_ip in ${WHITE_IP[@]}; do
                if [[ "ip${CONN_CIP}" =~ "ip${white_ip}" ]] || [[ "ip${CONN_CIP}" == "ip${white_ip}" ]]; then
                    CONN_WHITE_RESULT="0"
                    break 
                else
                    CONN_WHITE_RESULT="1"
                    continue
                fi
            done

            # 判断是否超过阀值、是否已经封杀过
            if [[ $CONN_SUM -ge $MAX_CONNECT_IP_NUM ]] && ! /sbin/iptables -L -vn| egrep -q "$CONN_CIP" && [[ "${CONN_WHITE_RESULT}t" == "1t" ]]; then
                # 封杀IP
                Config_iptables $CONN_CIP
                # 报警并记录日志
                echo "$(date +'%Y-%m-%d-%H:%M:%S') $CONN_CIP to ${pkey} connections is ${CONN_SUM} over $MAX_CONNECT_IP_NUM." >> $DROP_IP_LOG
                echo "Warn $(date +'%Y-%m-%d-%H:%M:%S') 封杀${CONN_CIP}.到SVR端${pkey}连接数:${CONN_SUM},阀值:$MAX_CONNECT_IP_NUM." >> $MSGFILE
            else
                continue
            fi
        fi
        unset CHEK_CONN_RESULT CONN_SUM CONN_CIP CONN_WHITE_RESULT
    done
}

main(){
    while true; do
        Net_traffic
        Port_connection
    done &
}
main
