set iso 50
set samp 50
set yrange [-4:4]
set xrange [-4:4]
set ztics 1
unset key
set style line 1 linecolor rgb '#cccccc'
set contour both
set cntrparam levels 10
set hidd
splot sin(x)+cos(2*y) with lines linestyle 1
