set xrange [-pi:pi]
unset key
set multiplot layout 2,2 title "Derivatives of Sin(x)" font "Times-Roman, 22"
set style arrow 1 head filled size screen 0.03,15,135 lt 2 lw 2
set arrow 1 from screen .45, .84 to screen .65, .84 as 1
set arrow 2 from screen .87, .64 to screen .87, .3 as 1
set arrow 3 from screen .7, .15 to screen .4, .15 as 1
set arrow 4 from screen .35, .35 to screen .35, .7 as 1
set title "sin(x)"
plot sin(x)
set title "sin\'(x) = cos(x)"
plot cos(x)
set title "sin\'\'\'(x) = cos\'\'(x) = -sin\'(x) = -cos(x)"
plot -cos(x)
set title "sin\'\'(x) = cos\'(x) = -sin(x)"
plot -sin(x) 
unset multiplot 
