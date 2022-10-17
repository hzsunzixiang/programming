-module(freq_overload).
%-export([start_link/0, add/2, delete/2]).
%-export([no_frequency/0, frequency_available/0, frequency_denied/0]).
-compile(export_all).
-compile(nowarn_export_all).

start_link() ->
    case gen_event:start_link({local, ?MODULE}) of
	{ok, Pid} ->
	    add(counters_my, {}),
	    add(logger_my, {file, "log"}),
	    add(logger_my, standard_io),
	    {ok, Pid};
	Error ->
	    Error
    end.

no_frequency() -> gen_event:notify(?MODULE, {set_alarm, {no_frequency, self()}}).
frequency_available() -> gen_event:notify(?MODULE, {clear_alarm, no_frequency}).
frequency_denied() -> gen_event:notify(?MODULE, {event, {frequency_denied, self()}}).

add(M,A) -> gen_event:add_sup_handler(?MODULE, M, A).
delete(M,A) -> gen_event:delete_handler(?MODULE,M,A).

start1() ->
    start_link(),
    no_frequency(),
    frequency_available(),
    frequency_denied(),
    'this is an end'.
start() ->
    frequency:start_link(),
    freq_overload:start_link(),
    freq_overload:add(logger, standard_io),
    frequency:allocate(), frequency:allocate(), frequency:allocate(),
    frequency:allocate(), frequency:allocate(), frequency:allocate(),
    frequency:allocate(),
    frequency:allocate(),
    frequency:deallocate(15),
    counters_my:get_counters_my(freq_overload),
    'this is an end'.
