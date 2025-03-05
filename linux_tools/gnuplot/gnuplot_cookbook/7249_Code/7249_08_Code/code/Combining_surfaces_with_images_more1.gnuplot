set samp 40
set iso 40
set yrange [-1.5:1.5]
set xrange [-1.5:1.5]
unset ytics
unset xtics
unset key
unset colorbox
set hidden3d front
a = .5
set xyplane at a
f(x,y) = exp(-x**2-y**2)
splot f(x,y) with pm3d at b, f(x,y) with lines, a with lines lt -100
