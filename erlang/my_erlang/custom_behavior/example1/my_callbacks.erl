-module(my_callbacks).
-behavior(my_behavior).
-export([fn/1]).

fn(A) -> A + 1.
