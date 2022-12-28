
1> l(fun_param).
{module,fun_param}
2> {ok, Dev} = file:open("/home/ericksun/programming/erlang/my_erlang/rebar3/recon_use/README.fun_param.erl",[write]).
{ok,<0.182.0>}
3> recon_trace:calls({fun_param, '_', fun(_) -> return_trace() end}, 2000, [return_to, {scope, local}, {io_server, Dev}]).
7
4> fun_param:start().
hello:1
hello:2
hello:3
[{{<0.187.0>,#Ref<0.1455241026.3169583105.74>},1},
 {{<0.188.0>,#Ref<0.1455241026.3169583105.75>},2},
 {{<0.189.0>,#Ref<0.1455241026.3169583105.76>},3}]
5>

partition_parallel(F, Es) ->
    Parent = self(),
    Running = [{spawn_monitor(fun() -> Parent ! {self(), F(E)} end), E} || E <- Es].


start()->
   partition_parallel(
       fun (C) ->
           io:format("hello:~p~n", [C])
       end, [1,2,3]).



%%%%%%%%%%%%%%
4:22:11.128788 <0.159.0> fun_param:module_info(exports)

4:22:11.135467 <0.159.0> fun_param:module_info/1 --> [{partition_parallel,2},{start,0},{module_info,0},{module_info,1}]

4:22:11.135567 <0.159.0>  '--> edlin_expand:expand_function_name/3

4:22:12.026513 <0.161.0> fun_param:start()

4:22:12.026678 <0.161.0> fun_param:partition_parallel(#Fun<fun_param.0.111727472>, [1,2,3])

4:22:12.026917 <0.161.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'([1,2,3], #Fun<fun_param.0.111727472>, <0.161.0>)

4:22:12.027101 <0.161.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'([2,3], #Fun<fun_param.0.111727472>, <0.161.0>)

4:22:12.027327 <0.161.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'([3], #Fun<fun_param.0.111727472>, <0.161.0>)

4:22:12.027475 <0.161.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'([], #Fun<fun_param.0.111727472>, <0.161.0>)

4:22:12.027581 <0.161.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3 --> []

4:22:12.027704 <0.161.0>  '--> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3

4:22:12.027784 <0.161.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3 --> [{{<0.189.0>,#Ref<0.1455241026.3169583105.76>},3}]

4:22:12.027915 <0.161.0>  '--> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3

4:22:12.027998 <0.161.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3 --> [{{<0.188.0>,#Ref<0.1455241026.3169583105.75>},2},
 {{<0.189.0>,#Ref<0.1455241026.3169583105.76>},3}]

4:22:12.028143 <0.161.0>  '--> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3

4:22:12.028222 <0.161.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3 --> [{{<0.187.0>,#Ref<0.1455241026.3169583105.74>},1},
 {{<0.188.0>,#Ref<0.1455241026.3169583105.75>},2},
 {{<0.189.0>,#Ref<0.1455241026.3169583105.76>},3}]

4:22:12.028375 <0.161.0> fun_param:partition_parallel/2 --> [{{<0.187.0>,#Ref<0.1455241026.3169583105.74>},1},
 {{<0.188.0>,#Ref<0.1455241026.3169583105.75>},2},
 {{<0.189.0>,#Ref<0.1455241026.3169583105.76>},3}]

4:22:12.028514 <0.161.0> fun_param:start/0 --> [{{<0.187.0>,#Ref<0.1455241026.3169583105.74>},1},
 {{<0.188.0>,#Ref<0.1455241026.3169583105.75>},2},
 {{<0.189.0>,#Ref<0.1455241026.3169583105.76>},3}]

4:22:12.028640 <0.161.0>  '--> erl_eval:do_apply/7

4:22:12.028705 <0.187.0> fun_param:'-partition_parallel/2-fun-1-'(#Fun<fun_param.0.111727472>, 1, <0.161.0>)

4:22:12.028787 <0.187.0> fun_param:'-start/0-fun-0-'(1)

4:22:12.028849 <0.188.0> fun_param:'-partition_parallel/2-fun-1-'(#Fun<fun_param.0.111727472>, 2, <0.161.0>)

4:22:12.028927 <0.188.0> fun_param:'-start/0-fun-0-'(2)

4:22:12.029285 <0.189.0> fun_param:'-partition_parallel/2-fun-1-'(#Fun<fun_param.0.111727472>, 3, <0.161.0>)

4:22:12.029746 <0.189.0> fun_param:'-start/0-fun-0-'(3)

4:22:12.030081 <0.187.0> fun_param:'-start/0-fun-0-'/1 --> ok

4:22:12.030323 <0.187.0>  '--> fun_param:'-partition_parallel/2-fun-1-'/3

4:22:12.030419 <0.187.0> fun_param:'-partition_parallel/2-fun-1-'/3 --> {<0.187.0>,ok}

4:22:12.030558 <0.187.0> unknown trace type return_to -- [undefined]

4:22:12.030644 <0.188.0> fun_param:'-start/0-fun-0-'/1 --> ok

4:22:12.030773 <0.188.0>  '--> fun_param:'-partition_parallel/2-fun-1-'/3

4:22:12.030868 <0.188.0> fun_param:'-partition_parallel/2-fun-1-'/3 --> {<0.188.0>,ok}

4:22:12.031025 <0.188.0> unknown trace type return_to -- [undefined]

4:22:12.031140 <0.189.0> fun_param:'-start/0-fun-0-'/1 --> ok

4:22:12.031259 <0.189.0>  '--> fun_param:'-partition_parallel/2-fun-1-'/3

4:22:12.031349 <0.189.0> fun_param:'-partition_parallel/2-fun-1-'/3 --> {<0.189.0>,ok}

4:22:12.031470 <0.189.0> unknown trace type return_to -- [undefined]
