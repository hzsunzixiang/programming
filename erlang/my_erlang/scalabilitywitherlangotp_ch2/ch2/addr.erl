-module(addr).
-export([type_test/1,start/0]).

-include_lib("kernel/include/inet.hrl").

% 函数调不通
%type_test(Addr) ->
%    {ok, HostEnt} = inet:gethostbyaddr(Addr),
%    HostEnt#hostent.h_addrtype.
%
type_test(Addr) ->
    %HostEnt = inet:gethostbyaddr(Addr),
    {ok, HostEnt} = inet:gethostbyname(Addr),
	% result: {ok,{hostent,"baidu.com",[],inet,4,[{39,156,66,10},{110,242,68,66}]}}
    HostEnt#hostent.h_addrtype.

type_record(Addr) ->
    %HostEnt = inet:gethostbyaddr(Addr),
    {ok, HostEnt} = inet:gethostbyname(Addr),
    HostEnt.

start() ->
    %type_test('l27.0.0.l'),
    %type_test('::l'),
    X = type_test('baidu.com'),
    io:format("result: ~p~n", [X]),
    Y = type_record('baidu.com'),
    io:format("result: ~p,~p~n", [Y#hostent.h_name, Y#hostent.h_addr_list]),
    'this is the end'.

%-record(hostent,
%	{
%	 h_name		  :: inet:hostname(),	%% official name of host
%	 h_aliases = []   :: [inet:hostname()],	%% alias list
%	 h_addrtype	  :: 'inet' | 'inet6',	%% host address type
%	 h_length	  :: non_neg_integer(),	%% length of address
%	 h_addr_list = [] :: [inet:ip_address()]%% list of addresses from name server
%	}).
