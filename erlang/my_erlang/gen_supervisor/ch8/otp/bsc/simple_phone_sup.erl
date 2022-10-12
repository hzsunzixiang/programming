-module(simple_phone_sup).
-behaviour(supervisor).

-export([start/0, start_link/0, attach_phone/1, detach_phone/1]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).
% 
%
%Module:init(Args) -> Result
%
%Notice that when the restart strategy is simple_one_for_one, the list of child specifications must be a list with one child specification only. (The child specification identifier is ignored.) No child process is then started during the initialization phase, but all children are assumed to be started dynamically using start_child/2.
%
%
init([]) ->
    hlr:new(),
    {ok, {{simple_one_for_one, 10, 3600},
	  [{ms, {phone_fsm, start_link, []},  % 这里的参数 是在 supervisor:start_child(?MODULE, [Ms]) 这里添加进来的
	    transient, 2000, worker, [phone_fsm]}]}}.


%%Race condiiton risk. Device attached after we check but before we start

%start_child(SupRef, ChildSpec) -> startchild_ret()
%
%For a simple_one_for_one supervisor, the child specification defined in Module:init/1 is used, and ChildSpec must instead be an arbitrary list of terms List. The child process is then started by appending List to the existing start function arguments, that is, by calling apply(M, F, A++List), where {M,F,A} is the start function defined in the child specification.
%
attach_phone(Ms) ->
    case hlr:lookup_id(Ms) of
	{ok, _Pid}    ->
	    {error, attached};
	_NotAttached ->
	    supervisor:start_child(?MODULE, [Ms])
    end.

detach_phone(Ms) ->
    case hlr:lookup_id(Ms) of
	{ok, Pid}    ->
	    supervisor:terminate_child(?MODULE, Pid);
	_NotAttached ->
	    {error, detached}
    end.
start() ->
    frequency_sup:start_link(),
    simple_phone_sup:start_link(),
    simple_phone_sup:attach_phone(l),
    simple_phone_sup:attach_phone(2),
    simple_phone_sup:attach_phone(3),
    simple_phone_sup:detach_phone(3),
    supervisor:which_children(simple_phone_sup),
    'this is an end'.



% Eshell V8.3.5.3  (abort with ^G)
% 1> frequency_sup:start_link().
% {ok,<0.60.0>}
% 2> simple_phone_sup:start_link().
% {ok,<0.64.0>}
% 3> simple_phone_sup:attach_phone(l).
% {ok,<0.66.0>}
% 4> simple_phone_sup:attach_phone(2).
% {ok,<0.68.0>}
% 5> simple_phone_sup:attach_phone(3).
% {ok,<0.70.0>}
% 6> supervisor:which_children(simple_phone_sup).
% [{undefined,<0.66.0>,worker,[phone_fsm]},
%  {undefined,<0.68.0>,worker,[phone_fsm]},
%  {undefined,<0.70.0>,worker,[phone_fsm]}]
% 7> simple_phone_sup:detach_phone(3).
% ok
% 8>
% =ERROR REPORT==== 5-Sep-2022::05:04:22 ===
% ** State machine <0.70.0> terminating
% ** Last message in was {'EXIT',<0.64.0>,shutdown}
% ** When State == idle
% **      Data  == 3
% ** Reason for termination =
% ** {'function not exported',
%        [{phone_fsm,terminate,[shutdown,idle,3],[]},
%         {gen_fsm,terminate,7,[{file,"gen_fsm.erl"},{line,543}]},
%         {proc_lib,init_p_do_apply,3,[{file,"proc_lib.erl"},{line,247}]}]}
% 8> supervisor:which_children(simple_phone_sup).
% [{undefined,<0.66.0>,worker,[phone_fsm]},
%  {undefined,<0.68.0>,worker,[phone_fsm]}]

