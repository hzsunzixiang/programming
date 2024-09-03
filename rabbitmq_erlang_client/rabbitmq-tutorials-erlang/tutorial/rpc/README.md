rpc
=====

tutorial--rpc

Build
-----

    $ rebar3 compile


Eshell V14.2.5.1 (press Ctrl+G to abort, type help(). for help)
(client@rabbitmq-1)1> rpc_client:start(["10"]).
 [x] Requesting fib(10)
 [.] Got 55
ok
(client@rabbitmq-1)2> rpc_client:start(["12"]).
 [x] Requesting fib(12)
 [.] Got 144
ok

{alias, [
    {send, [compile, {shell,
         "--eval 'send:start(), init:stop().'"}]},
    {recv, [compile, {shell,
         "--eval 'recv:start(), init:stop().'"}]},
    {new_task, [compile, {shell,
         "--eval 'new_task:start([\"A very hard task which takes two seconds\"]), init:stop().'"}]},
    {worker, [compile, {shell,
         "--eval 'worker:start(), init:stop().'"}]},
    {receive_logs, [compile,
         {shell, "--eval 'receive_logs:start(), init:stop().'"}]},
    {emit_log, [compile, {shell,
         "--eval 'emit_log:start([\"Info: This is the log message\"]), init:stop().'"}]},
    {receive_logs_direct, [compile, {shell,
         "--eval 'receive_logs_direct:start([\"Info\"]), init:stop().'"}]},
    {emit_log_direct, [compile, {shell,
         "--eval 'emit_log_direct:start([\"Info\", \"Hello\"]), init:stop().'"}]},
    {receive_logs_topic, [compile, {shell,
         "--eval 'receive_logs_topic:start([\"*.rabbit\"]), init:stop().'"}]},
    {emit_log_topic, [compile, {shell,
         "--eval 'emit_log_topic:start([\"red.rabbit\", \"Hello\"]), init:stop().'"}]},
    {rpc_server, [compile, {shell,
         "--eval 'rpc_server:start(), init:stop().'"}]},
    {rpc_client, [compile, {shell,
         "--eval 'rpc_client:start([\"10\"]), init:stop().'"}]}
]}.
