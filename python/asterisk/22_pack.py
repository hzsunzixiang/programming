#!/usr/bin/env python3
# -*- coding:UTF-8

# 在2.x下运行不过
if __name__ == '__main__':
   from random import randint
   
   def roll(*dice):
       return sum(randint(1, die) for die in dice)
   print(roll(6, 6, 6))

