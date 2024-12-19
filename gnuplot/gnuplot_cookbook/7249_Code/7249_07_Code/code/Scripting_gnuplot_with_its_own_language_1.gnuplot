set key at screen 1,.7
set rmargin at screen .8
plot [0 : 2*pi] for [n = 1 : 10 : 2] sin(n*x) title "sin(".n."x)" lt n
