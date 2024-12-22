#!/bin/bash


## 外层循环
#for ((i=-7; i<=7; i++))
#do
#    # 内层循环
#    for ((j=-7; j<=7; j++))
#    do
#        # 在这里可以添加你想要执行的操作，例如打印出i和j的值
#        echo "i = $i, j = $j"
#	    gnuplot -e "a='$i'" -e "b='$j'" plot_ecc.gp
#    done
#done
#num=1
#for ((i=2; i<=2; i++))
#do
#    # 内层循环
#    for ((j=3; j<=3; j++))
#    do
#        # 在这里可以添加你想要执行的操作，例如打印出i和j的值
#        echo "i = $i, j = $j"
#        FILE_NAME="./ecc_plot/$num.pdf"
#	    gnuplot -e "a='$i'" -e "b='$j'"  -e "file_name='$FILE_NAME'" plot_ecc.gp
#	    ((num++))
#    done
#done
rm ecc_plot/*
num=1
for ((i=0; i<=2; i++))
do
    # 内层循环
    for ((j=-2; j<=7; j++))
    do
        # 在这里可以添加你想要执行的操作，例如打印出i和j的值
        if [ $i -eq 0 ] && [ $j -eq 0 ]; then
            continue
        fi
        echo "i = $i, j = $j"
        FILE_NAME="./ecc_plot/$num.pdf"
	    gnuplot -e "a='$i'" -e "b='$j'"  -e "file_name='$FILE_NAME'" plot_ecc.gp
	    ((num++))
    done
done
