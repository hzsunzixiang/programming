#!/bin/bash

#-o或--options选项后面接可接受的短选项，如ab:c::，表示可接受的短选项为-a -b -c，其中-a选项不接参数，-b选项后必须接参数，-c选项的参数为可选的
#-l或--long选项后面接可接受的长选项，用逗号分开，冒号的意义同短选项。
#-n选项后接选项解析错误时提示的脚本名字
ARGS=`getopt -o hd:i:p:f: --long duration:,pid:,file:,help -n 'example.sh' --  "$@"`
if [ $? != 0 ]; then
    echo "Terminating..."
    exit 1
fi

usage ()
{
	echo "usage: $0 -d <duaration> -p <pid> -f <directory>" 
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

OUTPUT_DIR="$DIRECTORY"
mkdir -p $OUTPUT_DIR
#rm -f $OUTPUT_DIR/*




/usr/bin/env top -p $PROCESSID -b -d$DURATION |grep -w  $PROCESSID -B1 --line-buffered| awk '/[^--]/{
	if($0 ~ /PID/) 
		print "CUR_TIME "$0;
	else
		print strftime("%T",systime()), $0;
	fflush()
	}' >>$OUTPUT_DIR/top_data.out &

