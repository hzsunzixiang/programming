set multiplot
set object ellipse center .13, 0 size .4, 4
set arrow from .1, 2.1 to screen .22, .4 front lt 3
set samples 1000
set grid
set xtics .4
set ytics 4
plot [0:2*pi] exp(x)*sin(1/x)
set origin .2, .4
set size .25,.25
clear
unset key
unset grid
unset object
unset arrow
set xtics .1
set ytics .5
set bmargin 1
set tmargin 1
set lmargin 3
set rmargin 1
plot [0:.2] exp(x)*sin(1/x)
unset multiplot
