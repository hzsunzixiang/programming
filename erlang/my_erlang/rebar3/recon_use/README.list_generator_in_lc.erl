
list_generator_in_lc()->
	%  list generator in a list comprehension,
    [X+Y || X <- [1,2], Y <- [2,3]].

7:3:09.927854 <0.209.0> comprehension_binary:list_generator_in_lc()

7:3:09.928014 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^0/1-0-'([1,2])

7:3:09.928248 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'([2,3], [2], 1)

7:3:09.928334 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'([3], [2], 1)

7:3:09.928399 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'([], [2], 1)

7:3:09.928483 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^0/1-0-'([2])

7:3:09.928564 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'([2,3], [], 2)

7:3:09.928660 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'([3], [], 2)

7:3:09.928745 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'([], [], 2)

7:3:09.928823 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^0/1-0-'([])

7:3:09.928896 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^0/1-0-'/1 --> []

7:3:09.928975 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'/3 --> []

7:3:09.929070 <0.209.0>  '--> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'/3

7:3:09.929154 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'/3 --> [5]

7:3:09.929242 <0.209.0>  '--> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'/3

7:3:09.929315 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'/3 --> [4,5]

7:3:09.929388 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^0/1-0-'/1 --> [4,5]

7:3:09.929478 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'/3 --> [4,5]

7:3:09.929555 <0.209.0>  '--> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'/3

7:3:09.929650 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'/3 --> [4,4,5]

7:3:09.929762 <0.209.0>  '--> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'/3

7:3:09.929848 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^1/1-1-'/3 --> [3,4,4,5]

7:3:09.929924 <0.209.0> comprehension_binary:'-list_generator_in_lc/0-lc$^0/1-0-'/1 --> [3,4,4,5]

7:3:09.930008 <0.209.0> comprehension_binary:list_generator_in_lc/0 --> [3,4,4,5]

7:3:09.930099 <0.209.0>  '--> erl_eval:do_apply/7
