

注意看出，有个递归的过程


start()->
    [begin erlang:display(N), N*10 end || N <- lists:seq(1,3)].


1> l(comprehension).
{module,comprehension}
2> recon_trace:calls({comprehension, '_', fun(_) -> return_trace() end}, 2000, [return_to, {scope, local}]).
3> comprehension:start().
1
2
3

22:25:53.915449 <0.161.0> comprehension:start()
[10,20,30]

22:25:53.915608 <0.161.0> comprehension:'-start/0-lc$^0/1-0-'([1,2,3])

22:25:53.915680 <0.161.0> comprehension:'-start/0-lc$^0/1-0-'([2,3])

22:25:53.915755 <0.161.0> comprehension:'-start/0-lc$^0/1-0-'([3])

22:25:53.915813 <0.161.0> comprehension:'-start/0-lc$^0/1-0-'([])

22:25:53.915863 <0.161.0> comprehension:'-start/0-lc$^0/1-0-'/1 --> []

22:25:53.915910 <0.161.0>  '--> comprehension:'-start/0-lc$^0/1-0-'/1

22:25:53.915956 <0.161.0> comprehension:'-start/0-lc$^0/1-0-'/1 --> [30]

22:25:53.916005 <0.161.0>  '--> comprehension:'-start/0-lc$^0/1-0-'/1

22:25:53.916049 <0.161.0> comprehension:'-start/0-lc$^0/1-0-'/1 --> [20,30]

22:25:53.916103 <0.161.0>  '--> comprehension:'-start/0-lc$^0/1-0-'/1

22:25:53.916150 <0.161.0> comprehension:'-start/0-lc$^0/1-0-'/1 --> [10,20,30]

22:25:53.916206 <0.161.0> comprehension:start/0 --> [10,20,30]

22:25:53.916253 <0.161.0>  '--> erl_eval:do_apply/7

