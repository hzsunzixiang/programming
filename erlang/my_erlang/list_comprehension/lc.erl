-module(lc).
-export([f/1]).
f(Input) ->
  [N + 1 || N <- Input].
