#! /usr/bin/gnuplot
#set terminal pngcairo dashed enhanced
#set term png 
#set term postscript eps size 1024, 720 color blacktext "Helvetica" 24
#set output "memory.eps"
#set output "memory.png"
#set output "`date +%F`.2.png"


set terminal pdf linewidth 1
set output "diskio.pdf"

set multiplot layout 2,1

set xdata time
set timefmt "%H:%M:%S"
set grid


#FILE="diskio_data.txt"
set ylabel "KBytes" 
#set xtics rotate 90
set xtics rotate by -50
#set xtics rotate by 50 offset -4.5,-3.00
plot "diskio_data.txt" using 1:5 title "kB_rd/s" with lines

#12:39:31 AM   UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s iodelay  Command
#12:39:32 AM     0       446     -1.00     -1.00     -1.00       0  sshd

set ylabel "KBytes" 
plot "diskio_data.txt"  using 1:6 title "kB_wr/s" with lines

#gnuplot -e "datafile='${top_data_file.out}'; outputname='${output_file}'" top.gnuplot 
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; tiltle_des="-memory-"; lno=3" top_memory.gnuplot 


#gnuplot -e "datafile='${top_data_file}'; outputname='${cpu_output_file}'; title_des='-cpu-'; ylabel_des='cpu(%)'; lno=2"  ${SCRIPT}
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; title_des='-memory-'; ylabel_des='memory(M)'; lno=3"  ${SCRIPT}
