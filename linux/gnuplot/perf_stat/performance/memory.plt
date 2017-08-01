#! /usr/bin/gnuplot 

set terminal pdf linewidth 1
set output outputname

set multiplot layout 2,2



set xdata time
set timefmt "%H:%M:%S"
set grid


set ylabel "KBytes" 
set xtics rotate by -50

plot datafile using 1:7 title "rss/kbytes" with lines

# 某些版本有UID
#09:18:56 PM   UID       PID  minflt/s  majflt/s     VSZ    RSS   %MEM  Command
#09:18:57 PM     0       446      0.00      0.00   55184   5488   0.18  sshd

#05:51:49 PM       PID  minflt/s  majflt/s     VSZ    RSS   %MEM  Command
#05:51:50 PM      4773     85.86      0.00  141760   3952   0.19  wget

set ylabel "KBytes" 
plot datafile  using 1:6 title "vsz/kbytes" with lines

set ylabel "minflt/s" 
plot datafile using 1:4 title "minflt" with lines


set ylabel "majflt/s" 
plot datafile using 1:5 title "majflt" with lines
