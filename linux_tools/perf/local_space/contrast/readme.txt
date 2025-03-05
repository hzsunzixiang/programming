StephenSun@192.168.97.2:~/programming/perf/local_space/contrast$ perf  stat ./predict1
Time Expense is 60000
sum is 124750

 Performance counter stats for './predict1':

        147.051047      task-clock (msec)         #    0.997 CPUs utilized
                 1      context-switches          #    0.007 K/sec
                 2      cpu-migrations            #    0.014 K/sec
               829      page-faults               #    0.006 M/sec
       175,838,340      cycles                    #    1.196 GHz
       122,548,956      stalled-cycles-frontend   #   69.69% frontend cycles idle
   <not supported>      stalled-cycles-backend
       155,475,151      instructions              #    0.88  insns per cycle
                                                  #    0.79  stalled cycles per insn
        30,979,662      branches                  #  210.673 M/sec
            14,376      branch-misses             #    0.05% of all branches

       0.147437030 seconds time elapsed

StephenSun@192.168.97.2:~/programming/perf/local_space/contrast$ perf  stat ./predict2
Time Expense is 90000
sum is 1247444580

 Performance counter stats for './predict2':

        547.855324      task-clock (msec)         #    1.000 CPUs utilized
                 1      context-switches          #    0.002 K/sec
                 1      cpu-migrations            #    0.002 K/sec
               831      page-faults               #    0.002 M/sec
     1,153,284,220      cycles                    #    2.105 GHz
       712,164,491      stalled-cycles-frontend   #   61.75% frontend cycles idle
   <not supported>      stalled-cycles-backend
       776,481,805      instructions              #    0.67  insns per cycle
                                                  #    0.92  stalled cycles per insn
       181,269,710      branches                  #  330.871 M/sec
        15,339,080      branch-misses             #    8.46% of all branches

       0.547921505 seconds time elapsed

