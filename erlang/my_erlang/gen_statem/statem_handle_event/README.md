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



code_lock:code_length().



1:26:01.342557 <0.119.0> code_lock:handle_event(cast, {button,a}, locked, #{code=>[a,b,c], length=>3, buttons=>[]})
1:26:22.445186 <0.119.0> code_lock:handle_event({call,{<0.86.0>,#Ref<0.1554806085.963379202.241485>}}, code_length, open, #{code=>[a,b,c], length=>3, buttons=>[]})
1:26:25.691821 <0.119.0> code_lock:handle_event(state_timeout, lock, open, #{code=>[a,b,c], length=>3, buttons=>[]})
1:26:27.700459 <0.119.0> code_lock:handle_event({call,{<0.86.0>,#Ref<0.1554806085.963379202.241503>}}, code_length, locked, #{code=>[a,b,c], length=>3, buttons=>[]})

