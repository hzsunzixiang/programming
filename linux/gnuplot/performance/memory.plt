#! /usr/bin/gnuplot 
#set terminal pngcairo dashed enhanced
#set term png 
#set term postscript eps size 1024, 720 color blacktext "Helvetica" 24
#set output "memory.eps"
#set output "memory.png"
#set output "`date +%F`.2.png"


#set terminal pdf linewidth 1
set terminal pdf linewidth 1
set output "memory.pdf"


#set terminal png 
#set output "memory.png"

set multiplot layout 2,2



set xdata time
set timefmt "%H:%M:%S"
set grid


#FILE="memory.txt"
set ylabel "KBytes" 
#set xtics rotate 90
set xtics rotate by -50
#set xtics rotate by 50 offset -4.5,-3.00
plot "memory_data.txt" using 1:8 title "rss/kbytes" with lines

#09:18:56 PM   UID       PID  minflt/s  majflt/s     VSZ    RSS   %MEM  Command
#09:18:57 PM     0       446      0.00      0.00   55184   5488   0.18  sshd

set ylabel "KBytes" 
plot "memory_data.txt"  using 1:7 title "vsz/kbytes" with lines

set ylabel "minflt/s" 
plot "memory_data.txt" using 1:5 title "minflt" with lines


set ylabel "majflt/s" 
plot "memory_data.txt" using 1:6 title "majflt" with lines


#gnuplot -e "datafile='${top_data_file.out}'; outputname='${output_file}'" top.gnuplot 
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; tiltle_des="-memory-"; lno=3" top_memory.gnuplot 


#gnuplot -e "datafile='${top_data_file}'; outputname='${cpu_output_file}'; title_des='-cpu-'; ylabel_des='cpu(%)'; lno=2"  ${SCRIPT}
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; title_des='-memory-'; ylabel_des='memory(M)'; lno=3"  ${SCRIPT}
