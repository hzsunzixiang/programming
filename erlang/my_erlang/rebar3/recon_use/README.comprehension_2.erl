
foo:'-loop/4-lc$^2/1-3-'
^     ^    ^ ^   ^ ^ ^
1     2    3 4   5 6 7

1.Module name
2.The enclosing function
3.Arity of the enclosing function
4.The type of fun (lc = list generator in a list comprehension, blc = binary generator in a list comprehension, lbc = list generator in a binary comprehension, fun = fun)
5.Index of function within defining function (0 based)
6.Arity of the generated function
7.Index of lambda lifted function within defining function

% [X+Y || X <- [1,2], Y <- [2,3]].


1:59:32.599331 <0.159.0> comprehension_2:module_info(exports)

1:59:32.607092 <0.159.0> comprehension_2:module_info/1 --> [{start,0},{module_info,0},{module_info,1}]

1:59:32.607208 <0.159.0>  '--> edlin_expand:expand_function_name/3

1:59:33.534572 <0.161.0> comprehension_2:start()

1:59:33.534779 <0.161.0> comprehension_2:'-start/0-lc$^0/1-0-'([1,2])

1:59:33.535029 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'([2,3], [2], 1)

1:59:33.535182 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'([3], [2], 1)

1:59:33.535330 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'([], [2], 1)

1:59:33.535429 <0.161.0> comprehension_2:'-start/0-lc$^0/1-0-'([2])

1:59:33.535548 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'([2,3], [], 2)

1:59:33.535671 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'([3], [], 2)

1:59:33.535804 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'([], [], 2)

1:59:33.536056 <0.161.0> comprehension_2:'-start/0-lc$^0/1-0-'([])

1:59:33.536174 <0.161.0> comprehension_2:'-start/0-lc$^0/1-0-'/1 --> []

1:59:33.536291 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'/3 --> []

1:59:33.536393 <0.161.0>  '--> comprehension_2:'-start/0-lc$^1/1-1-'/3

1:59:33.536511 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'/3 --> [5]

1:59:33.536648 <0.161.0>  '--> comprehension_2:'-start/0-lc$^1/1-1-'/3

1:59:33.536723 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'/3 --> [4,5]

1:59:33.536803 <0.161.0> comprehension_2:'-start/0-lc$^0/1-0-'/1 --> [4,5]

1:59:33.536926 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'/3 --> [4,5]

1:59:33.537042 <0.161.0>  '--> comprehension_2:'-start/0-lc$^1/1-1-'/3

1:59:33.537135 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'/3 --> [4,4,5]

1:59:33.537263 <0.161.0>  '--> comprehension_2:'-start/0-lc$^1/1-1-'/3

1:59:33.537360 <0.161.0> comprehension_2:'-start/0-lc$^1/1-1-'/3 --> [3,4,4,5]

1:59:33.537488 <0.161.0> comprehension_2:'-start/0-lc$^0/1-0-'/1 --> [3,4,4,5]

1:59:33.537592 <0.161.0> comprehension_2:start/0 --> [3,4,4,5]

1:59:33.537730 <0.161.0>  '--> erl_eval:do_apply/7
