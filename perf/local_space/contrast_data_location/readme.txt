


对于同样的求和功能实现，Summation2比Summation1性能优化三倍左右，这是由于Summation1中我们是直接对指针操作，也就是直接对cache进行读写，每次循环要进行两次读一次写cache，而在Summation2中我们把通过使用局部变量把对cache的读写转换为寄存器的读写，每次循环只有一次cache读和一次寄存器的读写。

StephenSun@192.168.97.2:~/programming/perf/local_space/contrast_data_location$ perf  stat  ./data_location1
Time Expense is 430000

 Performance counter stats for './data_location1':

        450.674269      task-clock (msec)         #    1.000 CPUs utilized
                 1      context-switches          #    0.002 K/sec
                 0      cpu-migrations            #    0.000 K/sec
            97,918      page-faults               #    0.217 M/sec
       943,273,080      cycles                    #    2.093 GHz
       486,004,587      stalled-cycles-frontend   #   51.52% frontend cycles idle
   <not supported>      stalled-cycles-backend
     1,519,084,512      instructions              #    1.61  insns per cycle
                                                  #    0.32  stalled cycles per insn
        87,738,628      branches                  #  194.683 M/sec
           103,426      branch-misses             #    0.12% of all branches

       0.450779340 seconds time elapsed

StephenSun@192.168.97.2:~/programming/perf/local_space/contrast_data_location$ perf  stat  ./data_location2
Time Expense is 260000

 Performance counter stats for './data_location2':

        283.954668      task-clock (msec)         #    0.999 CPUs utilized
                 1      context-switches          #    0.004 K/sec
                 0      cpu-migrations            #    0.000 K/sec
            49,091      page-faults               #    0.173 M/sec
       547,705,731      cycles                    #    1.929 GHz
       316,371,284      stalled-cycles-frontend   #   57.76% frontend cycles idle
   <not supported>      stalled-cycles-backend
       667,895,544      instructions              #    1.22  insns per cycle
                                                  #    0.47  stalled cycles per insn
        62,421,133      branches                  #  219.828 M/sec
            16,080      branch-misses             #    0.03% of all branches

       0.284192840 seconds time elapsed


## cache-misses 相差一个数量级
StephenSun@192.168.97.2:~/programming/perf/local_space/contrast_data_location$ perf stat -B -e cache-references,cache-misses,cycles,instructions,branches,faults,migrations ./data_location1
Time Expense is 430000

 Performance counter stats for './data_location1':

         5,398,545      cache-references
         4,046,404      cache-misses              #   74.954 % of all cache refs
       953,475,093      cycles
     1,519,207,553      instructions              #    1.59  insns per cycle
        87,764,973      branches
            97,917      faults
                 5      migrations

       0.459368125 seconds time elapsed

StephenSun@192.168.97.2:~/programming/perf/local_space/contrast_data_location$ perf stat -B -e cache-references,cache-misses,cycles,instructions,branches,faults,migrations ./data_location2
Time Expense is 310000

 Performance counter stats for './data_location2':

           590,494      cache-references
           426,738      cache-misses              #   72.268 % of all cache refs
       548,196,455      cycles
       667,964,339      instructions              #    1.22  insns per cycle
        62,433,638      branches
            49,091      faults
                 1      migrations

       0.333751340 seconds time elapsed

