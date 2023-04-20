#! /bin/bash

OUTPUT_DIR=mp3_player_out
if [[ ! -d $OUTPUT_DIR ]]
then
    if ! mkdir -p $OUTPUT_DIR
        then
            echo "Cannot create output directory" > /dev/stderr
        exit 1
    fi
fi
cd $OUTPUT_DIR
#make --file=$SOURCE_DIR/makefile "$@"

# 把 SOURCE_DIR  覆盖到 makefile中的变量
SOURCE_DIR=../
make SOURCE_DIR=../ --file=$SOURCE_DIR/makefile  "$@"


#make --file=../makefile

# run.sh
# run.sh clean
