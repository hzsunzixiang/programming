

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

* 4. statem_handle_event_stop
    3.16  Stopping
In a Supervision Tree
Standalone gen_statem


* statem_state_event_time_out
   3.17  Event Time-Outs

* statem_state_generic_time_out
3.18  Generic Time-Outs


* statem_erlang_timers
3.19  Erlang Timers

* statem_state_postpone

3.20  Postponing Events

*	statem_state_enter
3.21  State Enter Actions 每当有状态变化时 whenever it does a state change.

Say you have a state machine specification that uses state enter actions. Although you can code this using inserted events (described in the next section), especially if just one or a few states has got state enter actions, this is a perfect use case for the built in state enter calls.

You return a list containing state_enter from your callback_mode/0 function and the gen_statem engine will call your state callback once with an event (enter, OldState, ...) whenever it does a state change. Then you just need to handle these event-like calls in all states.




* statem_state_2
先 down, 然后再 up
  state_enter

* statem_handle_event_2

This section describes what to change in the example to use one handle_event/4 function. The previously used approach to first branch depending on event does not work that well here because of the state enter calls, so this example first branches depending on state

* statem_handle_event_complex

statem_erlang_timers
statem_handle_event
statem_handle_event_stop
statem_state
statem_state_2
statem_state_common
statem_state_enter
statem_state_event_time_out
statem_state_generic_time_out
statem_state_postpone
statem_state_selective_receive

