set param
set iso 50
set ztics .5
set xtics .4
set ytics .4
set urange [-pi:pi]
set vrange [-pi:pi]
set hidd
splot cos(u)*cos(v), sin(u)*cos(v), sin(u)
