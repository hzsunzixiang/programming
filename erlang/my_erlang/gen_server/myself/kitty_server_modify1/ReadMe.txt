


# 保持和gen_server的接口一致

# terminate业务的方式是通过  handle_call的返回

Module:handle_call(Request, From, State) -> Result

{stop,Reason,NewState}
{stop,Reason,Reply,NewState}
The gen_server process will call Module:terminate(Reason,NewState) and then terminate.

{stop,_,Reply,_} will create a reply to the client request just as {reply,Reply,...} while {stop,_,_} will not, so just as for {noreply,NewState,...} a reply has to be created by calling reply(From, Reply) before returning {stop,_,_}.
