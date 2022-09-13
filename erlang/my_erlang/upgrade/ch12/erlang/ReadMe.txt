github@9.134.165.238:~/program/programming/erlang/my_erlang/upgrade/ch12/erlang (master)$ erl
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Eshell V12.2  (abort with ^G)
1> coffee:module_info(attributes).
[{vsn,[171233942305136801942262688388838049130]}]
2> {ok, {coffee, MD5Digest}} = beam_lib:md5(coffee).
{ok,{coffee,<<128,210,117,43,179,200,220,11,59,150,121,
              113,155,231,197,106>>}}
3> <<Int:128/integer>> = MD5Digest, Int.
171233942305136801942262688388838049130
4>

github@9.134.165.238:~/program/programming/erlang/my_erlang/upgrade/ch12/erlang (master)$ erl
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Eshell V12.2  (abort with ^G)
1> coffee:module_info().
[{module,coffee},
 {exports,[{start_link,0},
           {init,0},
           {tea,0},
           {espresso,0},
           {americano,0},
           {cappuccino,0},
           {cup_removed,0},
           {pay,1},
           {cancel,0},
           {module_info,0},
           {module_info,1}]},
 {attributes,[{vsn,[171233942305136801942262688388838049130]}]},
 {compile,[{version,"8.0.4"},
           {options,[]},
           {source,"/data/github/program/programming/erlang/my_erlang/upgrade/ch12/erlang/coffee.erl"}]},
 {md5,<<128,210,117,43,179,200,220,11,59,150,121,113,155,
        231,197,106>>}]

