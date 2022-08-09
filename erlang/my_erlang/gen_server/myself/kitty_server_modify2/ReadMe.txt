


# 保持和gen_server的接口一致

# terminate业务的方式是通过  stop 函数来的


stop(ServerRef :: server_ref()) -> ok
OTP 18.0
stop(ServerRef :: server_ref(),
     Reason :: term(),
     Timeout :: timeout()) ->
        ok
OTP 18.0
Orders the generic server specified by ServerRef to exit with the specified Reason, default 'normal', and waits for it to terminate. The gen_server process calls Module:terminate/2 before exiting.

The function returns ok if the server terminates with the expected reason. Any other reason than normal, shutdown, or {shutdown,Term} causes an error report to be issued using logger(3). An exit signal with the same reason is sent to linked processes and ports.

Timeout is an integer that specifies how many milliseconds to wait for the server to terminate, or the atom infinity to wait indefinitely, which is the default. If the server has not terminated within the specified time, the call exits the calling process with reason timeout.

If the process does not exist, the call exits the calling process with reason noproc, and with reason {nodedown,Node} if the connection fails to the remote Node where the server runs.


