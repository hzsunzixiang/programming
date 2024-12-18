from numpy import *
import time
def makeit():
   f = open('randomnormal.text', 'w')
   a = [f.write("%g\n" % (random.normal())) for v in range(0, 1000)]
   f.close()
while True:
   makeit()
   time.sleep(3)


