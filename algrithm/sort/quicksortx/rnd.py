#!/usr/bin/env python
"""Print a fixed number of random numbers to standard output."""
import random
import sys
try:
    N = int(sys.argv[1])
except IndexError:
    N = 10
x = range(N)
random.shuffle(x)
print " ".join(map(str, x))
