set xrange [-pi:pi]
set yrange [-pi:pi]
set zrange [-pi:pi]
unset key
set iso 20
set samp 20
set ztics 1.5
set view 37,300
a = .9
splot '++' using 1:2:(2*a*cos($2)*sin($1)):(-a*sin($1)*cos($2)):(a*cos($1)*sin($2)):(a*cos($1)) w vec

