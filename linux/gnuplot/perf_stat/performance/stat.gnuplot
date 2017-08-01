#! /usr/bin/gnuplot
set xdata time
set timefmt "%H:%M:%S"
set term png 
set grid
#set output "`date +%F`.2.png"
set output outputname
set ylabel ylabel_des
#plot "top_g2.txt"  using 1:2 title "--cpu--" with lines
plot datafile using 1:lno title title_des with lines
#gnuplot -e "datafile='${top_data_file.out}'; outputname='${output_file}'" top.gnuplot 
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; tiltle_des="-memory-"; lno=3" top_memory.gnuplot 

