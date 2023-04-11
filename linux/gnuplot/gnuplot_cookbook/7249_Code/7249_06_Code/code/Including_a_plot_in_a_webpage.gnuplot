set term svg font "Arial,12"
set out 'r6fig.svg'
unset key
plot [0:.5] sin(1/x) lw 2
