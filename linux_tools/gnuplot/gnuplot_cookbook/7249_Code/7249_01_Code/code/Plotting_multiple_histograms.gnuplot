set style fill solid 1.0 border lt -1
set style data histograms
plot [0:40] 'parabolaCircles.text' using (-$2),\
  '' using (20*$3) notitle
