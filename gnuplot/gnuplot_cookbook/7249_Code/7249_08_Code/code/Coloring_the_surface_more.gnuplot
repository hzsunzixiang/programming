set iso 30
set samp 30
unset key
set title "J_0(r^2)"
set xrange [-4:4]
set yrange [-4:4]
set ztics 1
unset surf
set style line 1 lt 4 lw .5
set pm3d at s hidd 1
splot besj0(x**2+y**2)
