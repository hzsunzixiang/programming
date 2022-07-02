lspci -nnDvs  0000:02:04.0
echo "after unbind"
for i in 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0
do
    echo "========$i================"
    #lspci -nnDvs $i |grep Kernel
    lspci -nnDvs $i
    echo "========$i================"
        echo
done

