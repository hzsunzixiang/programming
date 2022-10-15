
# 直接用 escript 脚本找到
LIB_DIR=`./lib_dir.escipt`
#echo $LIB_DIR

ERTS_VERSION=$(echo $(basename `ls -d $LIB_DIR/erts-*`)|awk -F'-' '{print $2}')
echo $ERTS_VERSION
KERNEL_VERSION=$(echo $(basename `ls -d $LIB_DIR/kernel-*`)|awk -F'-' '{print $2}')
echo $KERNEL_VERSION
STDLIB_VERSION=$(echo $(basename `ls -d $LIB_DIR/stdlib-*`)|awk -F'-' '{print $2}')
echo $STDLIB_VERSION
SASL_VERSION=$(echo $(basename `ls -d $LIB_DIR/sasl-*`)|awk -F'-' '{print $2}')
echo $SASL_VERSION


sed 's/erts_version/'"$ERTS_VERSION"'/g;s/kernel_version/'"$KERNEL_VERSION"'/g; s/stdlib_version/'"$STDLIB_VERSION"'/g; s/sasl_version/'"$SASL_VERSION"'/g' basestation.rel.template | tee basestation.rel

