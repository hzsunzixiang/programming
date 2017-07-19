#! /usr/bin/gnuplot
#set terminal pngcairo dashed enhanced
#set term png 
#set term postscript eps size 1024, 720 color blacktext "Helvetica" 24
#set output "memory.eps"
#set output "memory.png"
#set output "`date +%F`.2.png"


set terminal pdf linewidth 1
set output "switch.pdf"

set multiplot layout 2,1

set xdata time
set timefmt "%H:%M:%S"
set grid


#12:59:38 AM   UID       PID   cswch/s nvcswch/s  Command
#12:59:39 AM     0       446      0.00      0.00  sshd
#FILE="switch_data.txt"
set ylabel "cswch" 
#set xtics rotate 90
set xtics rotate by -50
#set xtics rotate by 50 offset -4.5,-3.00
plot "switch_data.txt" using 1:5 title "cswch/s" with lines


set ylabel "nvcswch" 
plot "switch_data.txt"  using 1:6 title "nvcswch/s" with lines

#gnuplot -e "datafile='${top_data_file.out}'; outputname='${output_file}'" top.gnuplot 
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; tiltle_des="-memory-"; lno=3" top_memory.gnuplot 


#gnuplot -e "datafile='${top_data_file}'; outputname='${cpu_output_file}'; title_des='-cpu-'; ylabel_des='cpu(%)'; lno=2"  ${SCRIPT}
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; title_des='-memory-'; ylabel_des='memory(M)'; lno=3"  ${SCRIPT}
