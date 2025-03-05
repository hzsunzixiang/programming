set x2tics -20 2
set xtics nomirror
set xrange [-10:10]
set x2range [-20:0]
plot sin(1/x) axis x1y1, 100*cos(x-1) axis x2y2
