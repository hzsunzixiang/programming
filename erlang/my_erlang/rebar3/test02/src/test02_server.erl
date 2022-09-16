%%%-------------------------------------------------------------------
%%% @author Dave Kuhlman
%%% @copyright (C) 2016, Dave Kuhlman
%%% @doc
%%%
%%% @end
%%% Created :  1 Aug 2016 by Dave Kuhlman <dkuhlman@crow>
%%%-------------------------------------------------------------------
-module(test02_server).

-behaviour(gen_server).

%% API
-export([
     start_link/0,
     stop/0,
     hello/1,
     shout/2,
     get_count/0
    ]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
     terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {count}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%%--------------------------------------------------------------------
%% @doc
%% Stops the server normally.
%%
%% @spec stop() -> ok
%% @end
%%--------------------------------------------------------------------
stop() ->
    gen_server:stop(?SERVER),
    ok.

%%--------------------------------------------------------------------
%% @doc
%% Prints a message and a count.
%%
%% @spec hello(Msg :: string()) -> ok
%% @end
%%--------------------------------------------------------------------
hello(Msg) ->
    gen_server:call(?SERVER, {hello, Msg}),
    ok.

%%--------------------------------------------------------------------
%% @doc
%% Prints a message multiple times.
%%
%% @spec shout(Msg :: string(), Multiple :: integer()) -> ok
%% @end
%%--------------------------------------------------------------------
shout(Msg, Multiple) ->
    gen_server:call(?SERVER, {shout, Msg, Multiple}).

%%--------------------------------------------------------------------
%% @doc
%% Returns the count of messages printed so far.
%%
%% @spec get_count() -> {ok, Count :: integer()}
%% @end
%%--------------------------------------------------------------------
get_count() ->
    {ok, Count} = gen_server:call(?SERVER, get_count),
    {ok, Count}.

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init([]) ->
    {ok, #state{count=0}}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @spec handle_call(Request, From, State) ->
%%                                   {reply, Reply, State} |
%%                                   {reply, Reply, State, Timeout} |
%%                                   {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, Reply, State} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_call({hello, Msg}, _From, #state{count=Count} = State) ->
    Count1 = Count + 1,
    io:format("~B. ~s~n", [Count1, Msg]),
    State1 = State#state{count=Count1},
    Reply = ok,
    {reply, Reply, State1};
handle_call({shout, Msg, Multiple}, _From, #state{count=Count} = State) ->
    {Reply, State1} = if
        0 < Multiple ->
            {ok, Count1} = shout_loop(Msg, Count, Count + Multiple),
            {ok, State#state{count=Count1}};
        true ->
            {{error, "Must be positive integer."}, State}
    end,
    {reply, Reply, State1};
handle_call(get_count, _From, #state{count=Count} = State) ->
    Reply = {ok, Count},
    {reply, Reply, State};
handle_call(Request, _From, State) ->
    io:format("unknown request: ~p~n", [Request]),
    Reply = ok,
    {reply, Reply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @spec handle_cast(Msg, State) -> {noreply, State} |
%%                                  {noreply, State, Timeout} |
%%                                  {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_cast(_Msg, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info(_Info, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
terminate(Reason, #state{count=Count} = _State) ->
    io:format("Terminated with reason ~p after ~B requests.~n",
          [Reason, Count]),
    ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

shout_loop(_Msg, Count, Count) ->
    {ok, Count};
shout_loop(Msg, Count, Max) ->
    Count1 = Count + 1,
    io:format("~B. ~s~n", [Count1, Msg]),
    shout_loop(Msg, Count1, Max).
