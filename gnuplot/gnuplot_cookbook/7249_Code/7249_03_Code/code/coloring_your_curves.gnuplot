set term x11 solid lw 4
set border lw .25
set key top left
plot [0:1] x**0.5 lc rgb 'orange', x lc rgb 'steelblue',\
           x**2 lc rgb 'bisque', x**3  lc rgb 'seagreen'
