set term pngcairo dashed
set out 'xsquared.png'
set samples 6
set key top left
set for [n = 1 : 4] arrow from first n, 0 to first n, n**2 back nohead lt 7
set for [n = 1 : 4] arrow from first 0, n**2 to first n, n**2 back nohead lt 7
set for [n = 0 : 5] ytics (n**2)
plot [0:5] x**2 with linespoints pt 7 ps 3
