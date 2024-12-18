set term svg
set out 'favorite.svg'
set samples 500
set encoding utf8
set title "Favorite Graph of Ǫrnólfr Þórðr" font "Helvetica, 24"
plot [0:10] sin(1/x)
