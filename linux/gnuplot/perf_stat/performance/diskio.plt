#! /usr/bin/gnuplot

set terminal pdf linewidth 1
set output  outputname

set multiplot layout 2,1

set xdata time
set timefmt "%H:%M:%S"
set grid


set ylabel "KBytes" 
set xtics rotate by -50

plot datafile  using 1:4 title "kB_rd/s" with lines

#12:39:31 AM   UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s iodelay  Command
#12:39:32 AM     0       446     -1.00     -1.00     -1.00       0  sshd

set ylabel "KBytes" 
plot datafile  using 1:5 title "kB_wr/s" with lines
