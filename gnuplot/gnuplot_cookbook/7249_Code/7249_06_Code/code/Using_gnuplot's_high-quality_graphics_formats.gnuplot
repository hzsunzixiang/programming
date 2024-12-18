set term pngcairo
set title 'Pngcairo terminal'
set out 'file.png'
unset key
set grid
set size .4,1
plot [0:1] sin(pi*x)
