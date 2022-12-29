
22:20:54.181262 <0.169.0> fun_param:start()

22:20:54.185874 <0.169.0> fun_param:partition_parallel(#Fun<fun_param.0.82396756>, #Fun<fun_param.1.82396756>, [1,2,3])

22:20:54.187962 <0.169.0> fun_param:'-partition_parallel/3-lc$^0/1-0-'([1,2,3], #Fun<fun_param.0.82396756>, <0.169.0>)

22:20:54.188056 <0.169.0> fun_param:'-partition_parallel/3-lc$^0/1-0-'([2,3], #Fun<fun_param.0.82396756>, <0.169.0>)

22:20:54.188135 <0.169.0> fun_param:'-partition_parallel/3-lc$^0/1-0-'([3], #Fun<fun_param.0.82396756>, <0.169.0>)

22:20:54.188239 <0.169.0> fun_param:'-partition_parallel/3-lc$^0/1-0-'([], #Fun<fun_param.0.82396756>, <0.169.0>)

22:20:54.188421 <0.169.0> fun_param:'-partition_parallel/3-lc$^0/1-0-'/3 --> []

22:20:54.188523 <0.169.0>  '--> fun_param:'-partition_parallel/3-lc$^0/1-0-'/3

22:20:54.188621 <0.169.0> fun_param:'-partition_parallel/3-lc$^0/1-0-'/3 --> [{{<0.197.0>,#Ref<0.1569497731.3873177601.18598>},3,helloworld}]

22:20:54.188727 <0.169.0>  '--> fun_param:'-partition_parallel/3-lc$^0/1-0-'/3

22:20:54.188825 <0.169.0> fun_param:'-partition_parallel/3-lc$^0/1-0-'/3 --> [{{<0.196.0>,#Ref<0.1569497731.3873177601.18597>},2,helloworld},
 {{<0.197.0>,#Ref<0.1569497731.3873177601.18598>},3,helloworld}]

22:20:54.188953 <0.169.0>  '--> fun_param:'-partition_parallel/3-lc$^0/1-0-'/3

22:20:54.189019 <0.169.0> fun_param:'-partition_parallel/3-lc$^0/1-0-'/3 --> [{{<0.195.0>,#Ref<0.1569497731.3873177601.18596>},1,helloworld},
 {{<0.196.0>,#Ref<0.1569497731.3873177601.18597>},2,helloworld},
 {{<0.197.0>,#Ref<0.1569497731.3873177601.18598>},3,helloworld}]

22:20:54.189151 <0.169.0> fun_param:partition_parallel/3 --> [{{<0.195.0>,#Ref<0.1569497731.3873177601.18596>},1,helloworld},
 {{<0.196.0>,#Ref<0.1569497731.3873177601.18597>},2,helloworld},
 {{<0.197.0>,#Ref<0.1569497731.3873177601.18598>},3,helloworld}]

22:20:54.189334 <0.169.0> fun_param:start/0 --> [{{<0.195.0>,#Ref<0.1569497731.3873177601.18596>},1,helloworld},
 {{<0.196.0>,#Ref<0.1569497731.3873177601.18597>},2,helloworld},
 {{<0.197.0>,#Ref<0.1569497731.3873177601.18598>},3,helloworld}]

22:20:54.189472 <0.169.0>  '--> erl_eval:do_apply/7

22:20:54.189573 <0.195.0> fun_param:'-partition_parallel/3-fun-1-'(#Fun<fun_param.0.82396756>, 1, <0.169.0>)

22:20:54.189721 <0.195.0> fun_param:'-start/0-fun-1-'(1)

22:20:54.189815 <0.196.0> fun_param:'-partition_parallel/3-fun-1-'(#Fun<fun_param.0.82396756>, 2, <0.169.0>)

22:20:54.189898 <0.196.0> fun_param:'-start/0-fun-1-'(2)

22:20:54.189980 <0.197.0> fun_param:'-partition_parallel/3-fun-1-'(#Fun<fun_param.0.82396756>, 3, <0.169.0>)

22:20:54.190051 <0.197.0> fun_param:'-start/0-fun-1-'(3)

22:20:54.190220 <0.195.0> fun_param:'-start/0-fun-1-'/1 --> ok

22:20:54.190382 <0.195.0>  '--> fun_param:'-partition_parallel/3-fun-1-'/3

22:20:54.190923 <0.195.0> fun_param:'-partition_parallel/3-fun-1-'/3 --> {ok}

22:20:54.191463 <0.195.0> unknown trace type return_to -- [undefined]

22:20:54.191715 <0.196.0> fun_param:'-start/0-fun-1-'/1 --> ok

22:20:54.191857 <0.196.0>  '--> fun_param:'-partition_parallel/3-fun-1-'/3

22:20:54.192066 <0.196.0> fun_param:'-partition_parallel/3-fun-1-'/3 --> {ok}

22:20:54.192192 <0.196.0> unknown trace type return_to -- [undefined]

22:20:54.192328 <0.197.0> fun_param:'-start/0-fun-1-'/1 --> ok

22:20:54.192429 <0.197.0>  '--> fun_param:'-partition_parallel/3-fun-1-'/3

22:20:54.192510 <0.197.0> fun_param:'-partition_parallel/3-fun-1-'/3 --> {ok}

22:20:54.192604 <0.197.0> unknown trace type return_to -- [undefined]
