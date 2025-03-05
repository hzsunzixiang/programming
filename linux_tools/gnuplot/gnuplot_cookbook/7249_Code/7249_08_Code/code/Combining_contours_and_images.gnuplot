set xrange [0:pi]
set yrange [0:pi]
set iso 100
set samp 100
set cntrparam levels 10
unset key
unset sur
set view map
set contour base
set pm3d at b
splot '++' using 1:2:($1**2-$2**2):(sin($1**2+$2**2)) with lines lw 2
