set iso 40
unset key
set title "J_0(r^2)"
set xrange [-4:4]
set yrange [-4:4]
set ztics 1
splot besj0(x**2+y**2)
set view 29,53 #Done implicity by mousing.
set term pngcairo mono enhanced
set out 'bessel.png'
replot
