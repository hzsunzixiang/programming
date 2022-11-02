#!/bin/bash

# 直接用 escript 脚本找到
# LIB_DIR=`./lib_dir.escipt`
LIB_DIR=`erl -noshell -eval 'io:format(code:lib_dir()),erlang:halt()'`

HEART_SCRIPT=simple_cache_heart
RELEASE_NAME=simple_cache
#echo $LIB_DIR

ERTS_VERSION=$(echo $(basename `ls -d $LIB_DIR/erts-*`)|awk -F'-' '{print $2}')
echo $ERTS_VERSION
KERNEL_VERSION=$(echo $(basename `ls -d $LIB_DIR/kernel-*`)|awk -F'-' '{print $2}')
echo $KERNEL_VERSION
STDLIB_VERSION=$(echo $(basename `ls -d $LIB_DIR/stdlib-*`)|awk -F'-' '{print $2}')
echo $STDLIB_VERSION
SASL_VERSION=$(echo $(basename `ls -d $LIB_DIR/sasl-*`)|awk -F'-' '{print $2}')
echo $SASL_VERSION
MNESIA_VERSION=$(echo $(basename `ls -d $LIB_DIR/mnesia-*`)|awk -F'-' '{print $2}')
echo $MNESIA_VERSION

sed 's/erts_version/'"$ERTS_VERSION"'/g;s/mnesia_version/'"$MNESIA_VERSION"'/g;s/kernel_version/'"$KERNEL_VERSION"'/g; s/stdlib_version/'"$STDLIB_VERSION"'/g; s/sasl_version/'"$SASL_VERSION"'/g' ${RELEASE_NAME}.rel.template > ${RELEASE_NAME}.rel


#ERLANG_DIR_NAME=$(echo $(dirname $LIB_DIR))
#echo $ERLANG_DIR_NAME
#sed 's#ERLANG_DIR_NAME#'"$ERLANG_DIR_NAME"'#g' handle_release.erl.template > handle_release.erl


sed 's/erts_version/'"$ERTS_VERSION"'/g' start.sh.template > start.sh

chmod +x start.sh

RUN_DIR_NAME=`pwd`/${RELEASE_NAME}_release
sed 's#RUN_DIR_NAME#'"$RUN_DIR_NAME"'#g' ${HEART_SCRIPT}.template > ${HEART_SCRIPT}
