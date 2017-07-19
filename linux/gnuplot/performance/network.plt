#! /usr/bin/gnuplot
#set terminal pngcairo dashed enhanced
set term png 
set output "network.png"
#set output "`date +%F`.2.png"
set multiplot layout 2,1


set xdata time
set timefmt "%H:%M:%S"
set grid
set ylabel "packet/s" 
plot "data.txt" using 1:2 title "packet" with lines



set ylabel "KBytes/s" 
plot "data.txt" using 1:3 title "traffic" with lines






#gnuplot -e "datafile='${top_data_file.out}'; outputname='${output_file}'" top.gnuplot 
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; tiltle_des="-memory-"; lno=3" top_memory.gnuplot 


#gnuplot -e "datafile='${top_data_file}'; outputname='${cpu_output_file}'; title_des='-cpu-'; ylabel_des='cpu(%)'; lno=2"  ${SCRIPT}
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; title_des='-memory-'; ylabel_des='memory(M)'; lno=3"  ${SCRIPT}
