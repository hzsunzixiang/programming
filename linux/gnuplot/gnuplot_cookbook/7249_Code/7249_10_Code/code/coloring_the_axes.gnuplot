set multi
set tmargin at screen .8
set rmargin at screen .8
set lmargin at screen .2
set bmargin at screen .2
unset key
set tics nomirror
set xrange [0:5]
set border 8
set border lt 4
set y2tics 0,25,150
unset ytics
set y2label "exp(x)" textcolor lt 4
plot exp(x) axis x1y2 lt 4
set border 7
set border lt -1
set ylabel "1/x" textcolor lt -1
unset y2label
set ytics 0,1,5
set tics nomirror
unset y2tics
set yrange [0:5]
plot 1/x lt -1
unset multi
