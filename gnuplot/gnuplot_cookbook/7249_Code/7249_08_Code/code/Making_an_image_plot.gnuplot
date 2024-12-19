set xrange [-4:4]
set yrange [-4:4]
set iso 100
set samp 100
unset key
unset sur
set view map
set pm3d at b
splot sin(y**2+x**2) - cos(x**2)
