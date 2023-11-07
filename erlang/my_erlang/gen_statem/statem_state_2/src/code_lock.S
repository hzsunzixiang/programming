{module, code_lock}.  %% version = 0

{exports, [{callback_mode,0},
           {code_length,0},
           {down,1},
           {init,1},
           {locked,3},
           {module_info,0},
           {module_info,1},
           {open,3},
           {start_link,1},
           {stop,0},
           {terminate,3},
           {up,1}]}.

{attributes, [{behaviour,[gen_statem]}]}.

{labels, 51}.


{function, start_link, 1, 2}.
  {label,1}.
    {line,[{location,"code_lock.erl",10}]}.
    {func_info,{atom,code_lock},{atom,start_link},1}.
  {label,2}.
    {move,{x,0},{x,2}}.
    {move,{atom,code_lock},{x,1}}.
    {move,nil,{x,3}}.
    {move,{literal,{local,code_lock_2}},{x,0}}.
    {line,[{location,"code_lock.erl",11}]}.
    {call_ext_only,4,{extfunc,gen_statem,start_link,4}}.


{function, stop, 0, 4}.
  {label,3}.
    {line,[{location,"code_lock.erl",12}]}.
    {func_info,{atom,code_lock},{atom,stop},0}.
  {label,4}.
    {move,{atom,code_lock_2},{x,0}}.
    {line,[{location,"code_lock.erl",13}]}.
    {call_ext_only,1,{extfunc,gen_statem,stop,1}}.


{function, down, 1, 6}.
  {label,5}.
    {line,[{location,"code_lock.erl",15}]}.
    {func_info,{atom,code_lock},{atom,down},1}.
  {label,6}.
    {test_heap,3,1}.
    {put_tuple2,{x,1},{list,[{atom,down},{x,0}]}}.
    {move,{atom,code_lock_2},{x,0}}.
    {line,[{location,"code_lock.erl",16}]}.
    {call_ext_only,2,{extfunc,gen_statem,cast,2}}.


{function, up, 1, 8}.
  {label,7}.
    {line,[{location,"code_lock.erl",17}]}.
    {func_info,{atom,code_lock},{atom,up},1}.
  {label,8}.
    {test_heap,3,1}.
    {put_tuple2,{x,1},{list,[{atom,up},{x,0}]}}.
    {move,{atom,code_lock_2},{x,0}}.
    {line,[{location,"code_lock.erl",18}]}.
    {call_ext_only,2,{extfunc,gen_statem,cast,2}}.


{function, code_length, 0, 10}.
  {label,9}.
    {line,[{location,"code_lock.erl",19}]}.
    {func_info,{atom,code_lock},{atom,code_length},0}.
  {label,10}.
    {move,{atom,code_length},{x,1}}.
    {move,{atom,code_lock_2},{x,0}}.
    {line,[{location,"code_lock.erl",20}]}.
    {call_ext_only,2,{extfunc,gen_statem,call,2}}.


{function, init, 1, 12}.
  {label,11}.
    {line,[{location,"code_lock.erl",21}]}.
    {func_info,{atom,code_lock},{atom,init},1}.
  {label,12}.
    {allocate,1,1}.
    {move,{x,0},{y,0}}.
    {move,{atom,true},{x,1}}.
    {move,{atom,trap_exit},{x,0}}.
    {line,[{location,"code_lock.erl",22}]}.
    {call_ext,2,{extfunc,erlang,process_flag,2}}.
    {line,[{location,"code_lock.erl",23}]}.
    {gc_bif,length,{f,0},0,[{y,0}],{x,0}}.
    {put_map_assoc,{f,0},
                   {literal,#{}},
                   {x,0},
                   1,
                   {list,[{atom,buttons},
                          nil,
                          {atom,code},
                          {y,0},
                          {atom,length},
                          {x,0}]}}.
    {test_heap,4,1}.
    {put_tuple2,{x,0},{list,[{atom,ok},{atom,locked},{x,0}]}}.
    {deallocate,1}.
    return.


{function, callback_mode, 0, 14}.
  {label,13}.
    {line,[{location,"code_lock.erl",26}]}.
    {func_info,{atom,code_lock},{atom,callback_mode},0}.
  {label,14}.
    {move,{literal,[state_functions,state_enter]},{x,0}}.
    return.


{function, handle_common, 3, 16}.
  {label,15}.
    {line,[{location,"code_lock.erl",32}]}.
    {func_info,{atom,code_lock},{atom,handle_common},3}.
  {label,16}.
    {test,is_tuple,{f,17},[{x,0}]}.
    {test,is_tagged_tuple,
          {f,15},
          [{tr,{x,0},{t_tuple,0,false,#{}}},2,{atom,call}]}.
    {test,is_eq_exact,{f,15},[{x,1},{atom,code_length}]}.
    {test,is_map,{f,15},[{x,2}]}.
    {get_map_elements,{f,15},
                      {tr,{x,2},{t_map,any,any}},
                      {list,[{atom,code},{x,3}]}}.
    {line,[{location,"code_lock.erl",44}]}.
    {gc_bif,length,{f,0},4,[{x,3}],{x,1}}.
    {test_heap,9,2}.
    {get_tuple_element,{x,0},1,{x,0}}.
    {put_tuple2,{x,0},{list,[{atom,reply},{x,0},{x,1}]}}.
    {put_list,{x,0},nil,{x,0}}.
    {put_tuple2,{x,0},{list,[{atom,keep_state_and_data},{x,0}]}}.
    return.
  {label,17}.
    {test,is_eq_exact,{f,15},[{x,0},{atom,cast}]}.
    {test,is_tuple,{f,15},[{x,1}]}.
    {test,test_arity,{f,15},[{x,1},2]}.
    {get_tuple_element,{x,1},0,{x,3}}.
    {get_tuple_element,{x,1},1,{x,4}}.
    {select_val,{x,3},{f,15},{list,[{atom,down},{f,20},{atom,up},{f,18}]}}.
  {label,18}.
    {test,is_map,{f,22},[{x,2}]}.
    {get_map_elements,{f,19},
                      {tr,{x,2},{t_map,any,any}},
                      {list,[{atom,button},{x,0}]}}.
    {test,is_eq_exact,{f,19},[{x,0},{x,4}]}.
    {allocate,1,5}.
    {move,{x,4},{y,0}}.
    {move,{x,2},{x,1}}.
    {move,{atom,button},{x,0}}.
    {line,[{location,"code_lock.erl",37}]}.
    {call_ext,2,{extfunc,maps,remove,2}}.
    {test_heap,13,1}.
    {put_tuple2,{x,1},{list,[{atom,button},{y,0}]}}.
    {put_tuple2,{x,1},{list,[{atom,next_event},{atom,internal},{x,1}]}}.
    {put_list,{x,1},nil,{x,1}}.
    {put_tuple2,{x,0},{list,[{atom,keep_state},{x,0},{x,1}]}}.
    {deallocate,1}.
    return.
  {label,19}.
    {move,{atom,keep_state_and_data},{x,0}}.
    return.
  {label,20}.
    {test,is_map,{f,21},[{x,2}]}.
    {put_map_assoc,{f,0},{x,2},{x,0},5,{list,[{atom,button},{x,4}]}}.
    {test_heap,3,1}.
    {put_tuple2,{x,0},{list,[{atom,keep_state},{x,0}]}}.
    return.
  {label,21}.
    {test_heap,3,3}.
    {put_tuple2,{x,0},{list,[{atom,badmap},{x,2}]}}.
    {line,[{location,"code_lock.erl",33}]}.
    {call_ext_only,1,{extfunc,erlang,error,1}}.
  {label,22}.
    {line,[{location,"code_lock.erl",35}]}.
    {case_end,{x,2}}.


{function, locked, 3, 24}.
  {label,23}.
    {line,[{location,"code_lock.erl",45}]}.
    {func_info,{atom,code_lock},{atom,locked},3}.
  {label,24}.
    {select_val,{x,0},
                {f,33},
                {list,[{atom,enter},
                       {f,31},
                       {atom,internal},
                       {f,27},
                       {atom,state_timeout},
                       {f,25}]}}.
  {label,25}.
    {test,is_eq_exact,{f,33},[{x,1},{atom,button}]}.
    {test,is_map,{f,26},[{x,2}]}.
    {line,[{location,"code_lock.erl",49}]}.
    {put_map_exact,{f,0},{x,2},{x,0},3,{list,[{atom,buttons},nil]}}.
    {test_heap,3,1}.
    {put_tuple2,{x,0},{list,[{atom,keep_state},{x,0}]}}.
    return.
  {label,26}.
    {test_heap,3,3}.
    {put_tuple2,{x,0},{list,[{atom,badmap},{x,2}]}}.
    {call_ext_only,1,{extfunc,erlang,error,1}}.
  {label,27}.
    {test,is_tagged_tuple,{f,33},[{x,1},2,{atom,button}]}.
    {test,is_map,{f,33},[{x,2}]}.
    {get_map_elements,{f,33},
                      {tr,{x,2},{t_map,any,any}},
                      {list,[{atom,length},
                             {x,5},
                             {atom,code},
                             {x,4},
                             {atom,buttons},
                             {x,3}]}}.
    {allocate,2,6}.
    {move,{x,4},{y,0}}.
    {move,{x,2},{y,1}}.
    {gc_bif,length,{f,28},6,[{x,3}],{x,0}}.
    {test,is_lt,{f,28},[{tr,{x,0},{t_integer,{0,288230376151711743}}},{x,5}]}.
    {move,{x,3},{x,0}}.
    {jump,{f,29}}.
  {label,28}.
    {line,[{location,"code_lock.erl",58}]}.
    {bif,tl,{f,0},[{x,3}],{x,0}}.
  {label,29}.
    {test_heap,2,2}.
    {get_tuple_element,{x,1},1,{x,1}}.
    {put_list,{x,1},nil,{x,1}}.
    {line,[{location,"code_lock.erl",59}]}.
    {call_ext,2,{extfunc,erlang,'++',2}}.
    {test,is_eq_exact,{f,30},[{tr,{x,0},{t_list,any,nil}},{y,0}]}.
    {test_heap,4,0}.
    {put_tuple2,{x,0},{list,[{atom,next_state},{atom,open},{y,1}]}}.
    {deallocate,2}.
    return.
  {label,30}.
    {line,[{location,"code_lock.erl",64}]}.
    {put_map_exact,{f,0},{y,1},{x,0},1,{list,[{atom,buttons},{x,0}]}}.
    {test_heap,4,1}.
    {put_tuple2,{x,0},
                {list,[{atom,keep_state},
                       {x,0},
                       {literal,[{state_timeout,30000,button}]}]}}.
    {deallocate,2}.
    return.
  {label,31}.
    {allocate,1,3}.
    {move,{x,2},{y,0}}.
    {line,[{location,"code_lock.erl",46}]}.
    {call,0,{f,41}}. % do_lock/0
    {test,is_map,{f,32},[{y,0}]}.
    {line,[{location,"code_lock.erl",47}]}.
    {put_map_exact,{f,0},{y,0},{x,0},0,{list,[{atom,buttons},nil]}}.
    {test_heap,3,1}.
    {put_tuple2,{x,0},{list,[{atom,keep_state},{x,0}]}}.
    {deallocate,1}.
    return.
  {label,32}.
    {test_heap,3,0}.
    {put_tuple2,{x,0},{list,[{atom,badmap},{y,0}]}}.
    {call_ext_last,1,{extfunc,erlang,error,1},1}.
  {label,33}.
    {call_only,3,{f,16}}. % handle_common/3


{function, open, 3, 35}.
  {label,34}.
    {line,[{location,"code_lock.erl",68}]}.
    {func_info,{atom,code_lock},{atom,open},3}.
  {label,35}.
    {select_val,{x,0},
                {f,39},
                {list,[{atom,enter},
                       {f,38},
                       {atom,internal},
                       {f,37},
                       {atom,state_timeout},
                       {f,36}]}}.
  {label,36}.
    {test,is_eq_exact,{f,39},[{x,1},{atom,lock}]}.
    {test_heap,4,3}.
    {put_tuple2,{x,0},{list,[{atom,next_state},{atom,locked},{x,2}]}}.
    return.
  {label,37}.
    {test,is_tagged_tuple,{f,39},[{x,1},2,{atom,button}]}.
    {move,{literal,{keep_state_and_data,[postpone]}},{x,0}}.
    return.
  {label,38}.
    {allocate,0,0}.
    {line,[{location,"code_lock.erl",69}]}.
    {call,0,{f,43}}. % do_unlock/0
    {move,{literal,{keep_state_and_data,[{state_timeout,10000,lock}]}},{x,0}}.
    {deallocate,0}.
    return.
  {label,39}.
    {call_only,3,{f,16}}. % handle_common/3


{function, do_lock, 0, 41}.
  {label,40}.
    {line,[{location,"code_lock.erl",77}]}.
    {func_info,{atom,code_lock},{atom,do_lock},0}.
  {label,41}.
    {move,nil,{x,1}}.
    {move,{literal,"Locked~n"},{x,0}}.
    {line,[{location,"code_lock.erl",78}]}.
    {call_ext_only,2,{extfunc,io,format,2}}.


{function, do_unlock, 0, 43}.
  {label,42}.
    {line,[{location,"code_lock.erl",79}]}.
    {func_info,{atom,code_lock},{atom,do_unlock},0}.
  {label,43}.
    {move,nil,{x,1}}.
    {move,{literal,"Open~n"},{x,0}}.
    {line,[{location,"code_lock.erl",80}]}.
    {call_ext_only,2,{extfunc,io,format,2}}.


{function, terminate, 3, 45}.
  {label,44}.
    {line,[{location,"code_lock.erl",82}]}.
    {func_info,{atom,code_lock},{atom,terminate},3}.
  {label,45}.
    {allocate,0,2}.
    {test,is_ne_exact,{f,46},[{x,1},{atom,locked}]}.
    {line,[{location,"code_lock.erl",83}]}.
    {call,0,{f,41}}. % do_lock/0
  {label,46}.
    {move,{atom,ok},{x,0}}.
    {deallocate,0}.
    return.


{function, module_info, 0, 48}.
  {label,47}.
    {line,[]}.
    {func_info,{atom,code_lock},{atom,module_info},0}.
  {label,48}.
    {move,{atom,code_lock},{x,0}}.
    {call_ext_only,1,{extfunc,erlang,get_module_info,1}}.


{function, module_info, 1, 50}.
  {label,49}.
    {line,[]}.
    {func_info,{atom,code_lock},{atom,module_info},1}.
  {label,50}.
    {move,{x,0},{x,1}}.
    {move,{atom,code_lock},{x,0}}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
