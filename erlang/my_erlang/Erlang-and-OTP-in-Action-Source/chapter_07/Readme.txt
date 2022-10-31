
6> spawn(fun die_please2:go/0).
<0.100.0>
7> =ERROR REPORT==== 30-Oct-2022::22:45:29.541988 ===
Error in process <0.100.0> with exit value:
{{badmatch,right_now},
 [{die_please2,go,0,[{file,"die_please2.erl"},{line,10}]}]}


7> proc_lib:spawn(fun die_please2:go/0).
<0.102.0>
8> =CRASH REPORT==== 30-Oct-2022::22:45:48.797414 ===
  crasher:
    initial call: die_please2:go/0
    pid: <0.102.0>
    registered_name: []
    exception error: no match of right hand side value right_now
      in function  die_please2:go/0 (die_please2.erl, line 10)
    ancestors: [<0.98.0>]
    message_queue_len: 0
    messages: []
    links: []
    dictionary: []
    trap_exit: false
    status: running
    heap_size: 233
    stack_size: 28
    reductions: 142
  neighbours:

