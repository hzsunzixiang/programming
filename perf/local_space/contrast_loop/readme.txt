运行若干次 分支预测确实有差别


StephenSun@192.168.97.2:~/programming/perf/local_space/contrast_loop$ perf  stat ./loop1
Time Expense is 26890000

 Performance counter stats for './loop1':

      26899.205191      task-clock (msec)         #    1.000 CPUs utilized
             7,852      context-switches          #    0.292 K/sec
               158      cpu-migrations            #    0.006 K/sec
               262      page-faults               #    0.010 K/sec
    66,481,811,306      cycles                    #    2.472 GHz
    54,805,941,977      stalled-cycles-frontend   #   82.44% frontend cycles idle
   <not supported>      stalled-cycles-backend
    30,851,675,430      instructions              #    0.46  insns per cycle
                                                  #    1.78  stalled cycles per insn
    10,330,618,952      branches                  #  384.049 M/sec
       100,235,547      branch-misses             #    0.97% of all branches

      26.910603234 seconds time elapsed

StephenSun@192.168.97.2:~/programming/perf/local_space/contrast_loop$ perf  stat ./loop2
Time Expense is 24650000

 Performance counter stats for './loop2':

      24621.106924      task-clock (msec)         #    0.996 CPUs utilized
            24,695      context-switches          #    0.001 M/sec
                62      cpu-migrations            #    0.003 K/sec
               262      page-faults               #    0.011 K/sec
    60,893,060,073      cycles                    #    2.473 GHz
    50,785,543,942      stalled-cycles-frontend   #   83.40% frontend cycles idle
   <not supported>      stalled-cycles-backend
    30,196,761,828      instructions              #    0.50  insns per cycle
                                                  #    1.68  stalled cycles per insn
    10,038,704,918      branches                  #  407.728 M/sec
           358,897      branch-misses             #    0.00% of all branches

      24.720536446 seconds time elapsed


