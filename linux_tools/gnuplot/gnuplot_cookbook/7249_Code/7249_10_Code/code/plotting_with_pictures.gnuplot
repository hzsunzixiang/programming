set title "Elbonian Warhead Inventory" font "Times,24" offset 0,2
set xlabel "Year" font "Times,12"
set xlabel "Year" font "Times,16"
set ylabel "Number of Operational Warheads\n" font "Times,16"
unset key
set tics nomirror
set xtics scale 0
set for [n = 0 : 3] ytics (sprintf("%d", n*10) 200*n)
set for [n = 0 : 3] xtics (sprintf("%d", 1990+10*n) 91+200*n)
set xtics add ("2020\n(Projected)" 691)
set cbrange [0:250]
set pal gray positive
set view map
unset colorbox
splot for [n = 0 : 3] 'bomb.png' binary filetype=auto center=(91+200*n, 300*0.2*(1+n), 0) dy=0.2*(1+n) with image
