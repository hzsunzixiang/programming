set term pngcairo enhanced size 750, 1000 
set out 'p3.png'
unset key
set rmargin 10
set xrange [0:110]
set yrange [55:105]
set xlabel '% eligible entering 1st grade'
set ylabel '% youth literacy'
min(a,b) = (a<b?a:b)
max(a,b) = (a<b?b:a)
scale(x) = min(max(x/1000000,8), 32)
CountryName(String,Size) = sprintf("{/=%d %s}", scale(Size), String)
plot 'p3.dat' using 2:3:(CountryName(stringcolumn(1),$4)) with labels
