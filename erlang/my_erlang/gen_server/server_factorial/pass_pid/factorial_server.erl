-module(factorial_server).
-behaviour(gen_server).

%% User interface grouping
-compile(export_all).
-compile(nowarn_export_all).

%% Gen Server
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).


%====================================
%% Client Call 这里是服务端代码 
%====================================
start_link() ->
    gen_server:start_link({global, ?MODULE}, ?MODULE, [], []).

stop(Pid) ->
    gen_server:cast(Pid, stop).

factorial(Pid, Val)->
    io:format("in server factorial....[~p, ~p]~n",[Pid, self()]),
    gen_server:call(Pid, {factorial, Val}).

factorial(Pid, Val, IoDevice)->
    gen_server:call(Pid, {factorial, Val, IoDevice}).



%====================================
%Call Back Functions 这里是客户端的回调
%====================================

init([])->
    process_flag(trap_exit, true),
    io:format("~p (~p) starting....~n", [{local, ?MODULE}, self()]),
    {ok, []}.

handle_call({factorial, Val, IoDevice}, _From, State)->
    {reply, factorial_logic:factorial(Val, 1, IoDevice), State};

%% 对应 gen_server:call(Pid, {factorial, Val}). 的参数
%% 这里的State 暂时没有起到作用
%% Reply 作为返回值 返回给 call/2/2
handle_call({factorial, Val}, _From, State)->
    {reply, factorial_logic:factorial(Val, 1), State};

handle_call(_Request,_From, State)->
    {reply, i_don_t_know, State}.

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(Info, State) ->
    {noreply, Info, State}.

terminate(_reason, _State)->
    io:format("terminating ~p~n", [{local,?MODULE}]),
    ok.

code_change(_oldVersion, State,_Extra)->
    {ok, State}.




