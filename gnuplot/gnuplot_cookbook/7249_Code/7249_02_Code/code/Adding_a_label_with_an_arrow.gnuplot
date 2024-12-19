set term postscript landscape
set out 'fourier.ps'
set yrange [-1.5:1.5]
set xrange [0:6.3]
set ytics nomirror
set y2tics 0,.1
set y2range [0:1.2]
set style fill pattern 5
set key at graph .9, .9 spacing 3 font "Helvetica, 14"
set xlabel "Time (sec.)" font "Courier, 12"
set ylabel "Amplitude" font "Courier, 12"
set y2label "Error Magnitude" font "Courier, 12"
set title "Fourier Approximation to Square Wave" font "Times-Roman, 24"
set label "Approximation error" right at 2.4, 0.45 offset -.5, 0
set arrow 1 from first 2.4, 0.45 to 3, 0.93 lt 1 lw 2 front size .3, 15
plot 'ch2.dat' using 1:2:(sgn($2)) with filledcurves notitle,\
  '' using 1:(sgn($2)) with lines title "Square Wave",\
  '' using 1:2 with lines lw 2 title "Fourier approximation",\
  '' using 1:(abs(sgn($2)-$2)) with lines axis x1y2 title "Error magnitude"
