-module(bug_4099).
-compile([export_all]).
-compile(nowarn_export_all).

% {write_concurrency, true | false}
% https://learnyousomeerlang.com/ets#the-concepts-of-ets
% Usually, writing to a table will lock the whole thing and nobody else can access it, either for reading or writing to it, until the write is done. Setting this option to 'true' lets both reads and writes be done concurrently, without affecting the ACID properties of ETS. Doing this, however, will reduce the performance of sequential writes by a single process and also the capacity of concurrent reads. You can combine this option with 'read_concurrency' when both writes and reads come in large bursts.

% Fixed in version: OTP-22.3
% https://github.com/erlang/otp/issues/4099
func2() ->
	 ets:new(t1, [public,named_table]),
	 catch ets:update_counter(t1, 101065, {1, 1}, {101065, 0}), 
	 Length = ets:info(t1, size),
	 io:format("Length Result:~p~n", [Length]),
     'this is an end'.

start() ->
     func2(),
     'this is an end'.

