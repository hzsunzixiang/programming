% https://learnyousomeerlang.com/maps
% https://medium.com/erlang-battleground/erlang-behaviors-4348e89351ff

-module(kvs).

-behavior(gen_server).

-export([start/0, store/2, retrieve/1]).
-export([init/1, handle_call/3, handle_cast/2]).

-type from() :: {pid(), Tag :: term()}. %% gen_server doesn't export a from/0 type
-type key() :: atom().
-type value() :: term().
-type data() :: #{key() => value()}.
-type state() :: #{data := data()}.
-export_type([key/0, value/0]).

-spec start() -> {ok, pid()} | {error, term()}.
start() -> gen_server:start({local, ?MODULE}, ?MODULE, #{}, []).

-spec store(key(), value()) -> ok.
store(K, V) -> gen_server:cast(?MODULE, {store, K, V}).

-spec retrieve(key()) -> notfound | value().
retrieve(K) -> gen_server:call(?MODULE, {retrieve, K}).


-spec init(map()) -> {ok, state()}.
init(#{}) -> {ok, #{data => #{}}}.

-spec handle_cast({store, key(), value()}, state()) -> {noreply, state()}.
handle_cast({store, K, V}, State = #{data := Data}) ->
  {noreply, State#{data := Data#{K => V}}}.

-spec handle_call({retrieve, key()}, from(), state()) ->
  {reply, notfound | value(), state()}.
handle_call({retrieve, K}, _From, State = #{data := Data}) ->
  {reply, maps:get(K, Data, notfound), State}.


% A module can export some types to declare that other modules are allowed to refer to them as remote types. This declaration has the following form:
% 
%   -export_type([T1/A1, ..., Tk/Ak]).
% Here the Ti's are atoms (the name of the type) and the Ai's are their arguments
% 
% Example:
% 
%   -export_type([my_struct_type/0, orddict/2]).
% Assuming that these types are exported from module 'mod', you can refer to them from other modules using remote type expressions like the following:
% 
%   mod:my_struct_type()
%   mod:orddict(atom(), term())
% It is not allowed to refer to types that are not declared as exported.
