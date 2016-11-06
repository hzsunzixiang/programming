#!/usr/bin/env python
"""Print a fixed number of identical numbers to standard output."""
import sys
try:
    M = int(sys.argv[2])
except IndexError:
    M = 7
try:
    N = int(sys.argv[1])
except IndexError:
    N = 10
x = [M]*N
print " ".join(map(str, x))
