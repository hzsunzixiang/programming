
#a = 0x20
#b = 0x13
#file_name
f(x) = sqrt(x**3 - a*x + b)
g(x) = -sqrt(x**3 - a*x + b)
set title "Elliptic Curve y^2=x^3 - ".a."x + ".b
set xlabel "x - axis"
set ylabel "y - axis"
set autoscale
unset key
set grid
set xrange[-3:6]
set yrange[-10:10]
set samples 100000
set style line 1 lt 1 lw 2 lc rgb "black"
set style line 2 lt 1 lw 2 lc rgb "black"

#set terminal epslatex
set term pdfcairo font "Arial,12"
#set out  "./ecc_plot/ecc_".a."_".b.".tex"
#set out  "./ecc_plot/ecc_".a."_".b.".pdf"
set out file_name 
unset key
plot f(x) ls 1, g(x) ls 2


#set term pdfcairo font "Arial,12"
#set out 'r2fig.pdf'
