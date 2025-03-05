set multiplot
unset key
unset tics
set polar
set size 1, .5
plot [pi:2*pi] 1 lw 5
set origin 0, .5
set size .5, .5
plot 1 lw 2, .2 with filledcurves
set origin .5, .5
plot 1 lw 2, .2 with filledcurves
unset multiplot
