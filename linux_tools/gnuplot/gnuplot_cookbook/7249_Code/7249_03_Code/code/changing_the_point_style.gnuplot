set term postscript landscape color solid  
set out 'file.ps'
set key top left
set style function linespoints
set style line 1 lw 4 lc rgb '#990042' ps 2 pt 6 pi 5
set style line 2 lw 3 lc rgb '#31f120' ps 2 pt 12 pi 3
set style line 3 lw 3 lc rgb '#0044a5' ps 2 pt 9 pi 5
set style line 4 lw 4 lc rgb '#888888' ps 2 pt 7 pi 4
plot [0:1] x**0.5 ls 1, x ls 2, x**2 ls 3, x**3 ls 4
