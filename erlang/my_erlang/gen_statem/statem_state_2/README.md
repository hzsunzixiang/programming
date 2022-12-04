statem_1
=====

An OTP application

Build
-----

    $ rebar3 compile

{ok, Dev} = file:open("./statem_recon_2.txt",[write]).
recon_trace:calls([{code_lock, '_', fun(_) -> return_trace() end}], 10000, [return_to,{scope, local}, {io_server, Dev}]).
code_lock:down(a).
code_lock:up(a).
code_lock:down(b).
code_lock:up(b).
code_lock:down(c).
code_lock:up(c).
