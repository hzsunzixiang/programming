{module, hello}.  %% version = 0

{exports, [{add,2},{module_info,0},{module_info,1}]}.

{attributes, []}.

{labels, 7}.


{function, add, 2, 2}.
  {label,1}.
    {line,[{location,"hello.erl",4}]}.
    {func_info,{atom,hello},{atom,add},2}.
  {label,2}.
    {line,[{location,"hello.erl",5}]}.
    {gc_bif,'+',{f,0},2,[{x,0},{x,1}],{x,0}}.
    return.


{function, module_info, 0, 4}.
  {label,3}.
    {line,[]}.
    {func_info,{atom,hello},{atom,module_info},0}.
  {label,4}.
    {move,{atom,hello},{x,0}}.
    {line,[]}.
    {call_ext_only,1,{extfunc,erlang,get_module_info,1}}.


{function, module_info, 1, 6}.
  {label,5}.
    {line,[]}.
    {func_info,{atom,hello},{atom,module_info},1}.
  {label,6}.
    {move,{x,0},{x,1}}.
    {move,{atom,hello},{x,0}}.
    {line,[]}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
