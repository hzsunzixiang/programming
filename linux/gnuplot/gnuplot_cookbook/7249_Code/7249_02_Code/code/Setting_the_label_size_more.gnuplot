set term postscript landscape
set output 'squarewave.ps'
set yrange [-1.5:1.5]
set xrange [0:6.3]
set ytics nomirror
set y2tics 0,.1
set y2range [0:1.2]
set style fill pattern 5
set key font "Helvetica, 14"
set xlabel "Time (sec.)" font "Courier, 12"
set ylabel "Amplitude" font "Courier, 12"
set y2label "Error Magnitude" font "Courier, 12"
set title "Fourier Approximation to Square Wave" font "Times-Roman, 32"
plot 'ch2.dat' using 1:2:(sgn($2)) with filledcurves,\
  '' using 1:2 with lines lw 2 notitle,\
  '' using 1:(sgn($2)) with lines notitle,\
  '' using 1:(abs(sgn($2)-$2)) with lines axis x1y2
