#! /usr/bin/gnuplot
set xdata time
set timefmt "%H:%M:%S"

#set term png 

#pdf  格式的图片分辨率更高
set terminal pdf linewidth 1

set grid
#set output "`date +%F`.2.png"
#set output "packet.png"
set output "pdf_format.pdf"
set ylabel "packet/s" 
#plot "top_g2.txt"  using 1:2 title "--cpu--" with lines
plot "data.txt" using 1:2 title "packet" with lines
