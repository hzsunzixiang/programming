#! /usr/bin/gnuplot
#set terminal pngcairo dashed enhanced

set terminal pdf linewidth 1

set output  outputname
set multiplot layout 2,1

set xtics rotate by -50

set xdata time
set timefmt "%H:%M:%S"
set grid
set ylabel "packets/s" 
plot datafile using 1:2 title "packet" with lines



set ylabel "KBytes/s" 
plot datafile using 1:3 title "traffic" with lines
