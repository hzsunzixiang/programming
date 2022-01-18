https://github.com/erlang/otp/issues/4099


OTP-Maintainer commented on 7 Jan 2020
Original reporter: kjellwinblad
Affected version: Not Specified
Fixed in version: OTP-22.3
Component: Not Specified
Migrated from: https://bugs.erlang.org/browse/ERL-1127

{code:java}
4> ets:new(t1, [public,named_table]). 
t1
5> catch ets:update_counter(t1, 101065, {1, 1}, {101065, 0}).     
{'EXIT',{badarg,[{ets,update_counter,
                      [t1,101065,{1,1},{101065,0}],
                      []},
                 {erl_eval,do_apply,6,[{file,"erl_eval.erl"},{line,684}]},
                 {erl_eval,expr,5,[{file,"erl_eval.erl"},{line,437}]},
                 {shell,exprs,7,[{file,"shell.erl"},{line,686}]},
                 {shell,eval_exprs,7,[{file,"shell.erl"},{line,642}]},
                 {shell,eval_loop,3,[{file,"shell.erl"},{line,627}]}]}}
6> ets:info(table_1, size).
18446744073709551615
7> 
{code}
