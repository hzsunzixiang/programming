set term canvas size 400,300 standalone mousing
set out 'Making_an_interactive_plot_for_the_web.html'
unset key
set grid
plot [0:.5] sin(1/x) lw 2

