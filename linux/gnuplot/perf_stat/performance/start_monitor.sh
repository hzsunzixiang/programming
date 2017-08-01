#!/bin/bash

#-o或--options选项后面接可接受的短选项，如ab:c::，表示可接受的短选项为-a -b -c，其中-a选项不接参数，-b选项后必须接参数，-c选项的参数为可选的
#-l或--long选项后面接可接受的长选项，用逗号分开，冒号的意义同短选项。
#-n选项后接选项解析错误时提示的脚本名字
ARGS=`getopt -o hd:i:p:f:P: --long duration:,pid:,file:,port:,help -n 'example.sh' --  "$@"`
if [ $? != 0 ]; then
    echo "Terminating..."
    exit 1
fi

usage ()
{
	echo "usage: $0 -d <duaration> -p <pid> -P <PORT> -f <directory>" 
	exit
}

#echo $ARGS
#将规范化后的命令行参数分配至位置参数（$1,$2,...)
eval set -- "${ARGS}"

while true
do
    case "$1" in
        -d|--duartion) 
            echo "Option d";
			export DURATION=$2
            shift 2
            ;;
        -p|--pid)
            echo "Option p, argument $2";
			export PROCESSID=$2
            shift 2
            ;;
        -P|--port)
            echo "Option P, argument $2";
			export PORT=$2
            shift 2
            ;;
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
if test -z "$DURATION" -o -z "$PROCESSID"
then
	usage
fi

if test -z "$DIRECTORY"
then 
	export DIRECTORY="logs"
fi

if test -z "$PORT"
then 
	echo "port is null exit"
	exit 1
fi

OUTPUT_DIR="$DIRECTORY"
mkdir -p $OUTPUT_DIR
#rm -f $OUTPUT_DIR/*

pidstat -d -p $PROCESSID  $DURATION  > $OUTPUT_DIR/diskio_data.txt  &
pidstat -r -p $PROCESSID  $DURATION  > $OUTPUT_DIR/memory_data.txt  & 
pidstat -u -p $PROCESSID  $DURATION  > $OUTPUT_DIR/cpu_data.txt     &
pidstat -w -p $PROCESSID  $DURATION  > $OUTPUT_DIR/switch_data.txt  &
sudo tcpdump -pnni any port $PORT -Uw   $OUTPUT_DIR/network_data_origin.pcap&
