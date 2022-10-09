

Eshell V13.0.4  (abort with ^G)
1> {ok, Pid} = client:start_link().
{ok,<0.83.0>}
2> sys:log(client, true).
ok
3> sys:statistics(client,true).
ok
4>  client:allocate(Pid).
1
5> client:allocate(Pid).
2
6> client:allocate(Pid).
3
7> client:freed(Pid,2).
ok
8> client:allocate(Pid).
2
9> sys:log(client, get).
{ok,[{in,alloc,<0.81.0>},
     {out,{client,1},<0.81.0>},
     {in,alloc,<0.81.0>},
     {out,{client,2},<0.81.0>},
     {in,alloc,<0.81.0>},
     {out,{client,3},<0.81.0>},
     {in,{free,2}},
     {in,alloc,<0.81.0>},
     {out,{client,2},<0.81.0>}]}
10> sys:log(client, print).
client event = {in,alloc,<0.81.0>}
client event = {out,{client,1},<0.81.0>}
client event = {in,alloc,<0.81.0>}
client event = {out,{client,2},<0.81.0>}
client event = {in,alloc,<0.81.0>}
client event = {out,{client,3},<0.81.0>}
client event = {in,{free,2}}
client event = {in,alloc,<0.81.0>}
client event = {out,{client,2},<0.81.0>}
ok
11> sys:get_status(client).
{status,<0.83.0>,
        {module,my_server},
        [[{'$initial_call',{my_server,init,2}},
          {'$ancestors',[<0.81.0>]}],
         running,<0.81.0>,
         [{statistics,{{{2022,10,9},{8,37,3}},{reductions,157},5,4}},
          {log,[1,
                {{out,{client,2},<0.81.0>},client,fun client:write_debug/3},
                {{in,alloc,<0.81.0>},client,fun client:write_debug/3},
                {{in,{free,2}},client,fun client:write_debug/3},
                {{out,{client,3},<0.81.0>},client,fun client:write_debug/3},
                {{in,alloc,<0.81.0>},client,fun client:write_debug/3},
                {{out,{client,2},<0.81.0>},client,fun client:write_debug/3},
                {{in,alloc,<0.81.0>},client,fun client:write_debug/3},
                {{out,{client,1},<0.81.0>},client,fun client:write_debug/3},
                {{in,alloc,<0.81.0>},client,fun client:write_debug/3}]}],
         {{[2,3,1],
           [4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20|...]},
          client}]}

