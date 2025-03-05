from numpy import *
import Gnuplot
g = Gnuplot.Gnuplot()
g.title('My Favorite Plot')
g.xlabel('x')
g.ylabel('sin(1/x)')
g('set term pngcairo')
g('set out "GnuplotFromPython.png"')
g('plot sin(1/x)')

