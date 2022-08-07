

这个工程体现不出来这个参数的用途


Result = {reply,Reply,NewState}
体现不出来 NewState 的用途

Module:handle_call(Request, From, State) -> Result
Types
Request = term()
From = from()
State = term()
Result = {reply,Reply,NewState}
  | {reply,Reply,NewState,Timeout}
  | {reply,Reply,NewState,hibernate}
  | {reply,Reply,NewState,{continue,Continue}}
  | {noreply,NewState}
  | {noreply,NewState,Timeout}
  | {noreply,NewState,hibernate}
  | {noreply,NewState,{continue,Continue}}
  | {stop,Reason,Reply,NewState}
  | {stop,Reason,NewState}
 Reply = term()
 NewState = term()
 Timeout = timeout()
 Continue = term()
 Reason = term()
