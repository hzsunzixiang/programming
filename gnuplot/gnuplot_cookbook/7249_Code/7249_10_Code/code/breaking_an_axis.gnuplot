set term pngcairo font "Times,8"
set out "plot.png"
set border 2
set zeroaxis lt -1
set ytics axis nomirror
set xtics axis nomirror
set tics out
set samp 5000
set xrange [0.007:.1]
set yrange [-.05:1]
s = .2
b = 0.03
w = .001
h = 1
h(x) = sin(1/x)**2
f(x) = (x<b?h(x):NaN)
g(x) = (x>b?h(x+s):NaN)
set xtics .005, .005, .025
set for [n = 4 : 10] xtics add(sprintf("%.3f", s + n/100.0) n/100.0)
set object 1 polygon from first b-w,-h to b+w,-h to b+w,h to b-w,h to b-w,-h front
set object 1 fillstyle pattern 5 lw 0
set key font "Times,12" samplen -1
plot f(x) title "sin(1/x)" lt -1, g(x) notitle lt -1
