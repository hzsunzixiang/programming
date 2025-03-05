set xdata time
set timefmt "%d/%m/%y %H:%M"
set format x "%d/%m/%y"
plot 'timedat.dat' using 1:3 with linespoints
