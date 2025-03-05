set samp 40
set iso 40
set yrange [-1.5:1.5]
set xrange [-1.5:1.5]
set zrange [0:1]
unset ytics
unset xtics
unset key
unset colorbox
set hidden3d front
a = .5
set xyplane at a
set contour base
f(x,y) = exp(-x**2-y**2)
splot '++' using 1:2:(a):(sin($1)*cos($2)) with pm3d at b, '++' using 1:2:(f($1,$2)) with lines, a with lines lt -100
