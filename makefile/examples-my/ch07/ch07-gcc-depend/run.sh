#! /bin/bash

SOURCE_DIR=../
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
make --file=$SOURCE_DIR/makefile 


#make --file=../makefile
