
4:32:05.325251 <0.169.0> fun_param:start()

4:32:05.330233 <0.169.0> fun_param:partition_parallel(#Fun<fun_param.0.29540929>, [1,2,3])

4:32:05.332943 <0.169.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'([1,2,3], #Fun<fun_param.0.29540929>, <0.169.0>)

4:32:05.333078 <0.169.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'([2,3], #Fun<fun_param.0.29540929>, <0.169.0>)

4:32:05.333284 <0.169.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'([3], #Fun<fun_param.0.29540929>, <0.169.0>)

4:32:05.333392 <0.169.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'([], #Fun<fun_param.0.29540929>, <0.169.0>)

4:32:05.333480 <0.169.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3 --> []

4:32:05.333571 <0.169.0>  '--> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3

4:32:05.333673 <0.169.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3 --> [{{<0.197.0>,#Ref<0.2116631824.1291321345.190784>},3,helloworld}]

4:32:05.333809 <0.169.0>  '--> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3

4:32:05.333878 <0.169.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3 --> [{{<0.196.0>,#Ref<0.2116631824.1291321345.190783>},2,helloworld},
 {{<0.197.0>,#Ref<0.2116631824.1291321345.190784>},3,helloworld}]

4:32:05.334016 <0.169.0>  '--> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3

4:32:05.334097 <0.169.0> fun_param:'-partition_parallel/2-lc$^0/1-0-'/3 --> [{{<0.195.0>,#Ref<0.2116631824.1291321345.190782>},1,helloworld},
 {{<0.196.0>,#Ref<0.2116631824.1291321345.190783>},2,helloworld},
 {{<0.197.0>,#Ref<0.2116631824.1291321345.190784>},3,helloworld}]

4:32:05.334219 <0.169.0> fun_param:partition_parallel/2 --> [{{<0.195.0>,#Ref<0.2116631824.1291321345.190782>},1,helloworld},
 {{<0.196.0>,#Ref<0.2116631824.1291321345.190783>},2,helloworld},
 {{<0.197.0>,#Ref<0.2116631824.1291321345.190784>},3,helloworld}]

4:32:05.334339 <0.169.0> fun_param:start/0 --> [{{<0.195.0>,#Ref<0.2116631824.1291321345.190782>},1,helloworld},
 {{<0.196.0>,#Ref<0.2116631824.1291321345.190783>},2,helloworld},
 {{<0.197.0>,#Ref<0.2116631824.1291321345.190784>},3,helloworld}]

4:32:05.334473 <0.169.0>  '--> erl_eval:do_apply/7

4:32:05.334534 <0.195.0> fun_param:'-partition_parallel/2-fun-1-'(#Fun<fun_param.0.29540929>, 1, <0.169.0>)

4:32:05.334611 <0.195.0> fun_param:'-start/0-fun-0-'(1)

4:32:05.334660 <0.196.0> fun_param:'-partition_parallel/2-fun-1-'(#Fun<fun_param.0.29540929>, 2, <0.169.0>)

4:32:05.334713 <0.196.0> fun_param:'-start/0-fun-0-'(2)

4:32:05.334753 <0.197.0> fun_param:'-partition_parallel/2-fun-1-'(#Fun<fun_param.0.29540929>, 3, <0.169.0>)

4:32:05.334879 <0.197.0> fun_param:'-start/0-fun-0-'(3)

4:32:05.334969 <0.195.0> fun_param:'-start/0-fun-0-'/1 --> ok

4:32:05.335050 <0.195.0>  '--> fun_param:'-partition_parallel/2-fun-1-'/3

4:32:05.335094 <0.195.0> fun_param:'-partition_parallel/2-fun-1-'/3 --> {<0.195.0>,ok}

4:32:05.335180 <0.195.0> unknown trace type return_to -- [undefined]

4:32:05.335233 <0.196.0> fun_param:'-start/0-fun-0-'/1 --> ok

4:32:05.335316 <0.196.0>  '--> fun_param:'-partition_parallel/2-fun-1-'/3

4:32:05.335399 <0.196.0> fun_param:'-partition_parallel/2-fun-1-'/3 --> {<0.196.0>,ok}

4:32:05.335487 <0.196.0> unknown trace type return_to -- [undefined]

4:32:05.335573 <0.197.0> fun_param:'-start/0-fun-0-'/1 --> ok

4:32:05.335617 <0.197.0>  '--> fun_param:'-partition_parallel/2-fun-1-'/3

4:32:05.335658 <0.197.0> fun_param:'-partition_parallel/2-fun-1-'/3 --> {<0.197.0>,ok}

4:32:05.335745 <0.197.0> unknown trace type return_to -- [undefined]
