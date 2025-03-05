set iso 40
set samp 40
unset key
set xrange [-pi:pi]
set yrange [-pi:pi]
set hidden front
f(x,y) = sin(x)*cos(y)
set xyplane at -1
splot f(x,y) with pm3d at b, f(x,y) with lines
