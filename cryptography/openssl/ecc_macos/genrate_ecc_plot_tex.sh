#!/bin/bash

# 循环生成10个段落，对应10组图片插入
for ((group=0; group<10; group++))
do
    echo "\begin{figure}[!htbp]"
    echo ""
    # 每组段落里循环插入3张图片
    for ((i=0; i<3; i++))
    do
        index=$((group * 3 + i + 1))
        pic_path="../Images/ecc_plot/$index"
        echo "  \begin{minipage}{0.3\textwidth} \centering"
        echo "    \includegraphics{$pic_path}"
        echo "  \end{minipage}"
    done
    echo "\end{figure}"
    echo ""
done > ecc_plot.tex
