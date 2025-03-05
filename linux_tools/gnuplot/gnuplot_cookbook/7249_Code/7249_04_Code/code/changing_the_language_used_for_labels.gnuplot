set xdata time
set locale "es_ES.utf8"
set timefmt "%d/%m/%y %H:%M"
set format x "%b %Y"
plot 'timedat.dat' using 1:3 with linespoints
