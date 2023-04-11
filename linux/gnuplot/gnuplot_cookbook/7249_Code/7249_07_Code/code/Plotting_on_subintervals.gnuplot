set samples 2000
f(x) = x < 0 ? sin(x) : NaN
g(x) = x >= 0 ? exp(-x/5.)*sin(x) : NaN
plot [-20 : 20] f(x), g(x)
