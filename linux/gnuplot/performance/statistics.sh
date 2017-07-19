#!/bin/bash


#09:18:56 PM   UID       PID  minflt/s  majflt/s     VSZ    RSS   %MEM  Command
#09:18:57 PM     0       446      0.00      0.00   55184   5488   0.18  sshd
#09:18:58 PM     0       446      0.00      0.00   55184   5488   0.18  sshd
#09:18:59 PM     0       446      0.00      0.00   55184   5488   0.18  sshd
#09:19:00 PM     0       446      0.00      0.00   55184   5488   0.18  sshd


#awk '{print $1, $f}'


cat memory.txt |grep -v CPU |grep -v PID |sed '/^\s*$/d'  > memory_final.txt
