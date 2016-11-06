#!/usr/bin/env python
"""Calculates the mean of numbers given through standard input, one per line."""
from __future__ import division
import sys
num = map(int, sys.stdin.read().strip().split("\n"))
print sum(num)/len(num)
