#!/usr/bin/env python3
# -*- coding:UTF-8

def palindromify(sequence):
    return list(sequence) + list(reversed(sequence))

def palindromify1(sequence):
    return [*sequence, *reversed(sequence)]

print(palindromify((1,2,3,4,5)))
print(palindromify1((1,2,3,4,5)))



def rotate_first_item(sequence):
    return [*sequence[1:], sequence[0]]

print(rotate_first_item((1,2,3,4,5)))



