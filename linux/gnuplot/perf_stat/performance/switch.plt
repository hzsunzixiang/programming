#! /usr/bin/gnuplot

set terminal pdf linewidth 1
set output  outputname

set multiplot layout 2,1
set xdata time
set timefmt "%H:%M:%S"
set grid


#12:59:38 AM   UID       PID   cswch/s nvcswch/s  Command
#12:59:39 AM     0       446      0.00      0.00  sshd

set ylabel "cswch" 
set xtics rotate by -50
plot datafile using 1:4 title "cswch/s" with lines


set ylabel "nvcswch" 
set xtics rotate by -50
plot datafile  using 1:5 title "nvcswch/s" with lines
