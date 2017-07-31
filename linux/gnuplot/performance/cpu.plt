#! /usr/bin/gnuplot

#set output "`date +%F`.2.png"


set terminal pdf linewidth 1

set output "cpu.pdf"
set multiplot layout 3,1

set xdata time
set timefmt "%H:%M:%S"
set grid


set ylabel "user" 
#set xtics rotate 90
set xtics rotate by -50
#set xtics rotate by 50 offset -4.5,-3.00



plot "cpu_data.txt" using 1:5 title "%user" with lines

#10:41:56 PM   UID       PID    %usr %system  %guest    %CPU   CPU  Command
#10:41:57 PM  1001     10050    2.15    0.00    0.00    2.15     0  wget
#10:41:58 PM  1001     10050    2.15    2.15    0.00    4.30     0  wget

set ylabel "system" 
plot "cpu_data.txt"  using 1:6 title "%system" with lines

set ylabel "CPU" 
plot "cpu_data.txt" using 1:7 title "%CPU" with lines


#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; tiltle_des="-memory-"; lno=3" top_memory.gnuplot 


#gnuplot -e "datafile='${top_data_file}'; outputname='${cpu_output_file}'; title_des='-cpu-'; ylabel_des='cpu(%)'; lno=2"  ${SCRIPT}
#gnuplot -e "datafile='${top_data_file}'; outputname='${mem_output_file}'; title_des='-memory-'; ylabel_des='memory(M)'; lno=3"  ${SCRIPT}
