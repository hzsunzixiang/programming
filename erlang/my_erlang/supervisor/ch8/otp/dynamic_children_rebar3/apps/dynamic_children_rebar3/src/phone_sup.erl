-module(phone_sup).
-behaviour(supervisor).

-export([start/0, start_link/0, attach_phone/1, detach_phone/1]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    {ok, {{one_for_one, 10, 3600}, []}}.


%%Race condition risk. Device attached after we check but before we start

attach_phone(Ms) ->
    case hlr:lookup_id(Ms) of
	{ok, _Pid}    ->
	    {error, attached};
	_NotAttached ->
	    ChildSpec = {Ms, {phone_fsm, start_link, [Ms]},
			 transient, 2000, worker, [phone_fsm]},
	    supervisor:start_child(?MODULE, ChildSpec)
    end.

detach_phone(Ms) ->
    case hlr:lookup_id(Ms) of
	{ok, _Pid}    ->
	    supervisor:terminate_child(?MODULE, Ms),
	    supervisor:delete_child(?MODULE, Ms);
	_NotAttached ->
	    {error, detached}
    end.
start() ->
    frequency_sup:start_link(),
    phone_sup:start_link(),
    hlr:new(),
    {ok, Pl} = phone_sup:attach_phone(l),
    {ok, P2} = phone_sup:attach_phone(2),
    phone_fsm:action({outbound,l}, P2),
    supervisor:which_children(phone_sup),
    supervisor:terminate_child(phone_sup, 2),
    supervisor:which_children(phone_sup),
    supervisor:restart_child(phone_sup, 2),
    supervisor:delete_child(phone_sup, 2),
    supervisor:terminate_child(phone_sup, 2),
    supervisor:delete_child(phone_sup, 2),
    supervisor:which_children(phone_sup),
    'this is an end'.
