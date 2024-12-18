set iso 100
set samp 100
unset key
set title "J_0(r^2)"
set xrange [-4:4]
set yrange [-4:4]
set ztics 1
unset surf
set pm3d
splot besj0(x**2+y**2)
