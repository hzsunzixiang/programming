set style fill pattern 5
plot 'intersection' using 1:2:3 with filledcurves,\
  '' using 1:2 lw 3 notitle, '' using 1:3 lw 3 notitle
