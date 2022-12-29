
binary_generator_in_lc()->
	%  binary generator in a list comprehension,
    [ X || <<X>> <= <<1,2,3,4,5>>, X rem 2 == 0].  


7:5:01.303819 <0.243.0> comprehension_binary:binary_generator_in_lc()

7:5:01.304024 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'(<<1,2,3,4,5>>)

7:5:01.304131 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'(<<2,3,4,5>>)

7:5:01.304231 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'(<<3,4,5>>)

7:5:01.304326 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'(<<4,5>>)

7:5:01.304422 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'(<<5>>)

7:5:01.304522 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'(<<>>)

7:5:01.304622 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'/1 --> []

7:5:01.304733 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'/1 --> []

7:5:01.304865 <0.243.0>  '--> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'/1

7:5:01.304977 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'/1 --> [4]

7:5:01.305127 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'/1 --> [4]

7:5:01.305230 <0.243.0>  '--> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'/1

7:5:01.305291 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'/1 --> [2,4]

7:5:01.305346 <0.243.0> comprehension_binary:'-binary_generator_in_lc/0-lc$^0/1-0-'/1 --> [2,4]

7:5:01.305422 <0.243.0> comprehension_binary:binary_generator_in_lc/0 --> [2,4]

7:5:01.305473 <0.243.0>  '--> erl_eval:do_apply/7
