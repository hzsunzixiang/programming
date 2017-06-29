
cache 命中率低 反倒 快？
是否数据没初始化的原因


StephenSun@192.168.97.2:~/programming/perf/local_space/contrast_local$ perf stat ./local1
Time Expense is 2410000
sum is 0

 Performance counter stats for './local1':

       2432.412020      task-clock (msec)         #    1.001 CPUs utilized
                 3      context-switches          #    0.001 K/sec
                 8      cpu-migrations            #    0.003 K/sec
             2,582      page-faults               #    0.001 M/sec
     5,847,695,612      cycles                    #    2.404 GHz
     3,773,137,028      stalled-cycles-frontend   #   64.52% frontend cycles idle
   <not supported>      stalled-cycles-backend
     5,553,398,511      instructions              #    0.95  insns per cycle
                                                  #    0.68  stalled cycles per insn
       510,899,151      branches                  #  210.038 M/sec
            77,891      branch-misses             #    0.02% of all branches

       2.430506930 seconds time elapsed

StephenSun@192.168.97.2:~/programming/perf/local_space/contrast_local$ perf stat ./local2
Time Expense is 3620000
sum is 0

 Performance counter stats for './local2':

       3770.324130      task-clock (msec)         #    1.001 CPUs utilized
                13      context-switches          #    0.003 K/sec
                34      cpu-migrations            #    0.009 K/sec
             2,582      page-faults               #    0.685 K/sec
     8,864,854,819      cycles                    #    2.351 GHz
     6,685,284,917      stalled-cycles-frontend   #   75.41% frontend cycles idle
   <not supported>      stalled-cycles-backend
     5,956,188,416      instructions              #    0.67  insns per cycle
                                                  #    1.12  stalled cycles per insn
       597,120,912      branches                  #  158.374 M/sec
           145,611      branch-misses             #    0.02% of all branches

       3.767372523 seconds time elapsed



StephenSun@192.168.97.2:~/programming/perf/local_space/contrast_local$ perf stat -B -e cache-references,cache-misses,cycles,instructions,branches,faults,migrations ./local1
Time Expense is 3730000
sum is 0

 Performance counter stats for './local1':

       155,889,814      cache-references
        83,004,643      cache-misses              #   53.246 % of all cache refs
     8,985,058,830      cycles
     7,066,937,172      instructions              #    0.79  insns per cycle
       835,563,289      branches
             4,115      faults
                40      migrations

       3.924801514 seconds time elapsed

StephenSun@192.168.97.2:~/programming/perf/local_space/contrast_local$ perf stat -B -e cache-references,cache-misses,cycles,instructions,branches,faults,migrations ./local2
Time Expense is 4240000
sum is 0

 Performance counter stats for './local2':

       613,668,435      cache-references
       102,498,584      cache-misses              #   16.703 % of all cache refs
    10,369,644,353      cycles
     6,562,719,043      instructions              #    0.63  insns per cycle
       727,139,025      branches
             2,582      faults
                18      migrations

       4.259752165 seconds time elapsed

