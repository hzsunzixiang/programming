set mapping spherical
set angles degrees
set isosamples 30
set xrange [-1:1]
set yrange [-1:1]
unset tics
unset border
set parametric
set hidden3d
set urange [-90:90]
set vrange [0:360]
unset key
splot cos(u)*cos(v),cos(u)*sin(v),sin(u) with lines lt rgb '#dddddd',\
      'world.dat' with lines lt -1

