set samp 100
set xtics .4
set ytics .4
set parametric
set urange [-pi:pi]
set ztics 1
splot cos(u),sin(3*u),cos(5*u) lw 2
