statem_1
=====

An OTP application

Build
-----

    $ rebar3 compile

%l(code_lock).
{ok, Dev} = file:open("./statem_recon_3.txt",[write]).
recon_trace:calls([{code_lock, '_', fun(_) -> return_trace() end}], 10000, [return_to,{scope, local}, {io_server, Dev}]).
%code_lock:start_link([a,b,c]).


25> code_lock:start_link([a,b,c], x).
Locked
{ok,<0.121.0>}

code_lock:button(a).
code_lock:button(b).
code_lock:button(c).
code_lock:button(y).
code_lock:set_lock_button(y).

