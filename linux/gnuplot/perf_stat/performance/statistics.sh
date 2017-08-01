#!/bin/bash

#-o或--options选项后面接可接受的短选项，如ab:c::，表示可接受的短选项为-a -b -c，其中-a选项不接参数，-b选项后必须接参数，-c选项的参数为可选的
#-l或--long选项后面接可接受的长选项，用逗号分开，冒号的意义同短选项。
#-n选项后接选项解析错误时提示的脚本名字
#set -x
ARGS=`getopt -o hf:i: --long file:,help -n 'example.sh' --  "$@"`
if [ $? != 0 ]; then
    echo "Terminating..."
    exit 1
fi

usage ()
{
	echo "usage: $0 -f <directory> "  
	exit
}

#echo $ARGS
#将规范化后的命令行参数分配至位置参数（$1,$2,...)
eval set -- "${ARGS}"

while true
do
    case "$1" in
        -f|--file)
            echo "Option f, argument $2";
			export DIRECTORY=$2
            shift 2
            ;;
        -h|--help)
            #echo "Option h, ";
			usage
			exit 1
            ;;
        --)
            shift
            break
            ;;

        *)
			usage
            ;;
    esac
done

if test -z "$DIRECTORY"
then 
	export DIRECTORY="logs"
	if [ ! -f $DIRECTORY ]; then
	    echo "the default File $DIRECTORY not found!"
		usage
		exit 1
	fi
fi


OUTPUT_DIR="$DIRECTORY"



CPU_FILE=$OUTPUT_DIR/cpu_data.txt
DISKIO_FILE=$OUTPUT_DIR/diskio_data.txt
MEMORY_FILE=$OUTPUT_DIR/memory_data.txt
SWITCH_FILE=$OUTPUT_DIR/switch_data.txt
NETWORK_FILE=$OUTPUT_DIR/network_data.txt


sudo tshark -t a -r $OUTPUT_DIR/network_data_origin.pcap -qz io,stat,1| awk -F'|' '$2 !~ /Time/  {if(NF==5) print $0}' |awk -F "|" '{print $2,$3,$4}' > $NETWORK_FILE


# 判断文件是否存在

sed -i '/Linux/d' $CPU_FILE
sed -i '/Linux/d' $DISKIO_FILE
sed -i '/Linux/d' $MEMORY_FILE
sed -i '/Linux/d' $SWITCH_FILE



# 输出文件
CPU_OUTPUT_FILE=$OUTPUT_DIR/cpu.pdf
DISKIO_OUTPUT_FILE=$OUTPUT_DIR/diskio.pdf
MEMORY_OUTPUT_FILE=$OUTPUT_DIR/memory.pdf
SWITCH_OUTPUT_FILE=$OUTPUT_DIR/switch.pdf
NETWORK_OUTPUT_FILE=$OUTPUT_DIR/network.pdf


gnuplot -e "datafile='${CPU_FILE}'; outputname='${CPU_OUTPUT_FILE}'"  cpu.plt
gnuplot -e "datafile='${DISKIO_FILE}'; outputname='${DISKIO_OUTPUT_FILE}'" diskio.plt 
gnuplot -e "datafile='${MEMORY_FILE}'; outputname='${MEMORY_OUTPUT_FILE}'" memory.plt 
gnuplot -e "datafile='${NETWORK_FILE}'; outputname='${NETWORK_OUTPUT_FILE}'" network.plt 
gnuplot -e "datafile='${SWITCH_FILE}'; outputname='${SWITCH_OUTPUT_FILE}'" switch.plt 


##统计 cpu内存平均值
#
#05:51:49 PM       PID    %usr %system  %guest    %CPU   CPU  Command
#05:51:50 PM      4773    0.00    0.00    0.00    0.00     0  wget

awk '{ sum += $4; n++ } END { if (n > 0) printf("cpu the average user cpu:%f\n", sum / n); }'  ${CPU_FILE}
awk '{ sum += $5; n++ } END { if (n > 0) printf("cpu the average system cpu:%f\n", sum / n); }'  ${CPU_FILE}
awk '{ sum += $7; n++ } END { if (n > 0) printf("cpu the average total cpu:%f\n", sum / n); }'  ${CPU_FILE}

# 内存
#05:51:49 PM       PID  minflt/s  majflt/s     VSZ    RSS   %MEM  Command
#05:51:50 PM      4773     85.86      0.00  141760   3952   0.19  wget

awk '{ sum += $6; n++ } END { if (n > 0) printf("memory the average VSZ:%f\n", sum / n); }'  ${MEMORY_FILE}
awk '{ sum += $7; n++ } END { if (n > 0) printf("memory the average RSS:%f\n", sum / n); }'  ${MEMORY_FILE}

#网络
# 17:51:55       17     5230 
#  17:51:56       89    68958 
#  17:51:57      117   107360 

awk '{ sum += $2; n++ } END { if (n > 0) printf("network the average packets/s:%f\n", sum / n); }'  ${NETWORK_FILE}
awk '{ sum += $3; n++ } END { if (n > 0) printf("network the average Kbytes/s:%f\n", sum / n / 1024.0); }'  ${NETWORK_FILE}

#磁盘


#05:51:49 PM       PID   kB_rd/s   kB_wr/s kB_ccwr/s  Command
#05:51:51 PM      4773      0.00      0.00      0.00  wget
awk '{ sum += $4; n++ } END { if (n > 0) printf("diskio the average kB_rd/s:%f\n", sum / n); }'  ${DISKIO_FILE}
awk '{ sum += $5; n++ } END { if (n > 0) printf("diskio the average kB_wr/s:%f\n", sum / n / 1024.0); }'  ${DISKIO_FILE}

#awk '{ sum += $3; n++ } END { if (n > 0) printf("the average memory:%fM\n", sum / n); }'  ${DATA_FILE}
##http://maravelias.info/2010/06/mean-standard-deviation-column-awk/
##awk '{sum+=$2; sumsq+=$2*$2} END {printf("the standard deviation:%f\n", sqrt(sumsq/NR - (sum/NR)^2))}'  ${DATA_FILE}
#awk '{delta = $2 - avg; avg += delta / NR; mean2 += delta * ($2 - avg); } END {printf("the standard deviation of cpu:%f\n",sqrt(mean2 / NR) )}'  ${DATA_FILE}
#awk '{delta = $3 - avg; avg += delta / NR; mean2 += delta * ($3 - avg); } END {printf("the standard deviation of memory:%f\n",sqrt(mean2 / NR) )}'  ${DATA_FILE}

