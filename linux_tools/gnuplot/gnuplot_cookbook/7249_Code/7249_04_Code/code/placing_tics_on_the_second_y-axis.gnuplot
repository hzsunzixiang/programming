set ytics nomirror
set y2tics .4
set my2tics 4
set xtics pi/4.
set mxtics 4
set grid
plot [0:2*pi] sin(x) axis x1y1, 2*cos(8*x)*exp(-x) axis x1y2
