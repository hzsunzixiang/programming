#! /usr/bin/gnuplot
set xdata time
set timefmt "%H:%M:%S"
set term png 
set grid
#set output "`date +%F`.2.png"
set output "packet.png"
set ylabel "packet/s" 
#plot "top_g2.txt"  using 1:2 title "--cpu--" with lines
plot "data.txt" using 1:2 title "packet" with lines
#plot "data.txt" using 1:3 title "traffic" with lines
#gnuplot -e "datafile='${top_data_file.out}'; outputname='${output_file}'" top.gnuplot 
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; tiltle_des="-memory-"; lno=3" top_memory.gnuplot 


#gnuplot -e "datafile='${top_data_file}'; outputname='${cpu_output_file}'; title_des='-cpu-'; ylabel_des='cpu(%)'; lno=2"  ${SCRIPT}
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; title_des='-memory-'; ylabel_des='memory(M)'; lno=3"  ${SCRIPT}
