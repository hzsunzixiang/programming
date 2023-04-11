set terminal tikz
set out 'r3.tex'
unset key
set label '\Large$\displaystyle \lim_{x\Longrightarrow0}\frac{\sin(x)}{x}=1$' at graph .55, .75
set title '\Large Illustrating L’H\^opital’s Rule: $\frac{\sin(x)}{x}$'
plot [0:15] sin(x)/x lw 2
