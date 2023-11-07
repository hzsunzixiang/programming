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

statem_handle_event
statem_handle_event_2
statem_handle_event_complex
statem_handle_event_stop
statem_state
statem_state_2
statem_state_common

