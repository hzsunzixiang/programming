set xrange [0:pi]
set yrange [0:pi]
set iso 20
set samp 20
unset key
a = .2
plot '++' using 1:2:(-a*sin($1)*cos($2)):(a*cos($1)*sin($2)) w vec size  .06, 15 filled
