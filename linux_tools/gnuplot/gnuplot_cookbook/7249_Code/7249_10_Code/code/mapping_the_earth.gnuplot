unset tics
unset border
unset key
set title "Earthquakes Worldwide 20Jan2012 Through 22Jan2012"
set style fill transparent solid 0.4 noborder
plot 'world.dat' with lines lt -1,\
      'earthquakes.dat' using 4:3:6 with circles

