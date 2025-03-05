set cntrparam levels 10
set contour base
unset sur
set view map
set xrange [-4:4]
set yrange [-4:4]
set iso 100
set samp 100
set key rmargin
splot sin(x)+cos(2*y)
