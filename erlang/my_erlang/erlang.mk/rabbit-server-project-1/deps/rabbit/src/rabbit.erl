%% This Source Code Form is subject to the terms of the Mozilla Public
%% License, v. 2.0. If a copy of the MPL was not distributed with this
%% file, You can obtain one at https://mozilla.org/MPL/2.0/.
%%
%% Copyright (c) 2007-2022 VMware, Inc. or its affiliates.  All rights reserved.
%%

-module(rabbit).

-behaviour(application).

-export([start/0]).

-export([start/2]).
-export([stop/1]).

start(normal, []) ->
    start_it(temporary).


start() ->
    %% start() vs. boot(): we want to throw an error in start().
    start_it(temporary).

start_it(StartType) ->
    {ok, _} = application:ensure_all_started(webchat, StartType).


stop(_State) ->
    ok.

