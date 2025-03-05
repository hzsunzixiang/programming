from numpy import *
import Gnuplot
g = Gnuplot.Gnuplot()
g.title('Normally Distributed Random Data')
g.xlabel('x')
g.ylabel('y')
g('set term pngcairo')
g('set out "GnuplotFromPython2.png"')
x = arange(1, 1000)
y = [random.normal() for i in x]
g.plot(Gnuplot.Data(x, y))
