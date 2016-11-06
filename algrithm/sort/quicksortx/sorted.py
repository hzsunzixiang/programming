#!/usr/bin/env python
"""Print a fixed number of sorted numbers to standard output."""
import sys
try:
    N = int(sys.argv[1])
except IndexError:
    N = 10
x = range(N)
print " ".join(map(str, x))
