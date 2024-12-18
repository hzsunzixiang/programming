set term svg 
set out 'file.svg'
set style fill transparent solid 0.3
plot [0:pi] sin(x)**2 with filledcurves above y1=0 lc rgb  '#00ffff',\
            0.75*cos(2*x)**2 with filledcurves above y1=0 lc rgb '#aa00aa'
