

% 这里是以  phone_sup.erl 模块来演示动态子进程的

ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_supervisor/ch8/otp/dynamic_children (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> frequency_sup:start_link().
{ok,<0.83.0>}
2> phone_sup:start_link().
{ok,<0.88.0>}
3> {ok, P1}= phone_sup:attach_phone(1).
{ok,<0.90.0>}
4> {ok, P2}= phone_sup:attach_phone(2).
{ok,<0.92.0>}
5> phone_fsm:action({outbound,1},P2).
*DBG* <0.92.0> got sync_all_state_event {outbound,1} from <0.81.0> in state idle
<0.92.0> dialing 1
*DBG* <0.92.0> sent ok to <0.81.0>
      and switched to state calling
*DBG* <0.90.0> got event {inbound,<0.92.0>} in state idle
*DBG* <0.90.0> switched to state receiving
ok
*DBG* <0.90.0> got event {action,reject} in state receiving
*DBG* <0.90.0> switched to state idle
*DBG* <0.92.0> got event {reject,<0.90.0>} in state calling
1 connecting to 2 failed:rejected
<0.92.0> cleared
*DBG* <0.92.0> switched to state idle

