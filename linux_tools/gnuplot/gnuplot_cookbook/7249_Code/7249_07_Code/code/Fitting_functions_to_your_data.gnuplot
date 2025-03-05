f(x) = a*sin(b*x)
fit f(x) 'rs.dat' via a, b
plot 'rs.dat' with lines lw 0.5 notitle, f(x) lw 4 title "Fit by gnuplot"
