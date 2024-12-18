
set yzeroaxis lt -1
set xtics ("$-\\pi / a$" -pi, "$0$" 0, "$\\pi / a$" pi)
set ytics ("$2 \\omega_0$" 2)


set xlabel "$k$"
set ylabel "$\\omega (k)$"
unset key
set sample 10000
set xrange[-pi:pi]
plot 2*abs(sin(x/2))
set terminal epslatex color colortext
set output "disp.tex"
replot
