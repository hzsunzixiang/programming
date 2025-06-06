-module(coffee_fsm).
-behaviour(gen_fsm).
-export([start_link/0, init/1]).
-export([selection/2, payment/2, remove/2]).
-export([americano/0, cappuccino/0, tea/0, espresso/0, 
         pay/1,cancel/0, cup_removed/0]). 

-export([stop/0, selection/3, payment/3, remove/3]).
-export([terminate/3]).

start_link() ->
    gen_fsm:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    hw:reboot(),
    hw:display("Make Your Selection", []),
    {ok, selection, []}.

%% Client Functions for Drink Selections
tea() ->  gen_fsm:send_event(?MODULE,{selection,tea,100}).
espresso() ->gen_fsm:send_event(?MODULE,{selection,espresso,150}).
americano() -> gen_fsm:send_event(?MODULE,{selection,americano,100}).
cappuccino() -> gen_fsm:send_event(?MODULE,{selection,cappuccino,150}).


%% Client Functions for Actions
pay(Coin)     -> gen_fsm:send_event(?MODULE,{pay, Coin}).
cancel()      -> gen_fsm:send_event(?MODULE,cancel).
cup_removed() -> gen_fsm:send_event(?MODULE,cup_removed).



%% State: drink selection
selection({selection,Type,Price}, _LoopData) ->
   hw:display("Please pay:~w",[Price]),
  {next_state, payment, {Type, Price, 0}};
selection({pay, Coin}, LoopData) ->
  hw:return_change(Coin),
  {next_state, selection, LoopData};
selection(_Other, LoopData) ->  
  {next_state, selection, LoopData}.


payment({pay, Coin}, {Type,Price,Paid}) 
                when Coin+Paid >= Price ->
    NewPaid = Coin + Paid,
    hw:display("Preparing Drink.",[]),
    hw:return_change(NewPaid - Price),
    hw:drop_cup(), hw:prepare(Type),
    hw:display("Remove Drink.", []),
    {next_state, remove, []};
payment({pay, Coin}, {Type,Price,Paid}) 
                when Coin+Paid < Price ->
    NewPaid = Coin + Paid,
    hw:display("Please pay:~w",[Price - NewPaid]),
    {next_state, payment, {Type, Price, NewPaid}};
payment(cancel, {_Type, _Price, Paid}) ->
    hw:display("Make Your Selection", []),
    hw:return_change(Paid),
    {next_state, selection, []};
payment(_Other, LoopData) ->
    {next_state, payment, LoopData}.


%% State: remove cup
remove(cup_removed, LoopData) ->
    hw:display("Make Your Selection", []),
    {next_state, selection, LoopData};
remove({pay, Coin}, LoopData) ->
    hw:return_change(Coin),
    {next_state, remove, LoopData};
remove(_Other, LoopData) ->
    {next_state, remove, LoopData}.


stop() -> gen_fsm:sync_send_event(?MODULE, stop).

remove(stop, _From, LoopData) ->
    {stop, normal, ok, LoopData}.
selection(stop, _From, LoopData) ->
    {stop, normal, ok, LoopData}.
payment(stop, _From, Paid) ->
    hw:return_change(Paid),
    {stop, normal, ok, 0}.

terminate(_Reason, _StateName, _LoopData) ->
    ok.
