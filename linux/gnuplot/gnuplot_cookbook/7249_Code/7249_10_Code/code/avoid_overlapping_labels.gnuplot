set xrange [0:2*pi]
set xtics 0, 0.12*pi, 2*pi
set xtics format "%.10f"
set xtics rotate by -30
set rmargin 10
plot sin(x)
