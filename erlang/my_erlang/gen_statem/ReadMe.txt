

3> code:load_file(code_lock).
{module,code_lock}
4> recon_trace:calls([{code_lock, '_', fun(_) -> return_trace() end}], 10000, [return_to,{scope, local}]).
11

code:load_file(code_lock).
recon_trace:calls([{code_lock, '_', fun(_) -> return_trace() end}], 10000, [return_to,{scope, local}]).


* 1. statem_state
* 2. statem_state_common
     handle_common

	 对应 3.14  All State Events


* 3. statem_handle_event
	 对应 3.15  One State Callback
	 If callback mode handle_event_function is used 

	 If callback mode handle_event_function is used, all events are handled in Module:handle_event/4 and we can (but do not have to) use an event-centered approach where we first branch depending on event and then depending on state:

* statem_state_2
  state_enter

