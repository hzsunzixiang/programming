unset key
unset surf
set view map
set contour base
unset clabel
set xrange [0:5]
set yrange [0:5]
set style fill solid
set for [n = 1:4] cntrparam levels discrete n**2
set for [n = 1:4] object n circle at n,n size 0.2 front fillcolor rgb '#ffffff' lw 0
set for [n = 1:4] label n sprintf("%d", n**2) at n,n center front
splot x*y
