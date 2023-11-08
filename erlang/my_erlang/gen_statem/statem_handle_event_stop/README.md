statem_1
=====

An OTP application

Build
-----

    $ rebar3 compile

%l(code_lock).
{ok, Dev} = file:open("./statem_recon_2.txt",[write]).
recon_trace:calls([{code_lock, '_', fun(_) -> return_trace() end}], 10000, [return_to,{scope, local}, {io_server, Dev}]).
%code_lock:start_link([a,b,c]).
code_lock:button(a).
code_lock:button(b).
code_lock:button(c).
code_lock:stop().

25> code_lock:button(a).
ok
26> code_lock:button(b).
ok
27> code_lock:button(c).
Unlock
ok
28> code_lock:code_length().
3
Lock
29> code_lock:stop().
ok
30> application:which_applications().
[{stdlib,"ERTS  CXC 138 10","5.1"},
 {kernel,"ERTS  CXC 138 10","9.1"}]


1:39:42.411557 <0.86.0> code_lock:stop()

1:39:42.411721 <0.119.0> code_lock:terminate(normal, locked, #{code=>[a,b,c], length=>3, buttons=>[]})

