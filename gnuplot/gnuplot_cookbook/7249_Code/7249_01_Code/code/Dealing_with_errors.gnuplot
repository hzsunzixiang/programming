set pointsize 3
set bars 3
plot [1:3] 'parabolaCircles.text' using 1:(-$2):3 with errorbars,\
  '' using 1:(-$2):3 pt 7 notitle
