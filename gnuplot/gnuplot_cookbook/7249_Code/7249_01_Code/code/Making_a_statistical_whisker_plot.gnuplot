set xrange [0:11]
set yrange [0:10]
set boxwidth 0.2
plot 'candlesticks.dat' using 1:3:2:6:5 with candlesticks lt -1 lw 2
whiskerbars,\
    '' using 1:4:4:4:4 with candlesticks lt -1 lw 2 notitle
