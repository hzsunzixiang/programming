
list_generator_in_bc()->
	%  list generator in a binary comprehension 
	RGB = [{213,45,132},{64,76,32},{76,0,0},{234,32,15}],
	<< <<R:8, G:8, B:8>> ||  {R,G,B} <- RGB >>. 

7:6:32.205364 <0.243.0> comprehension_binary:list_generator_in_bc()

7:6:32.205579 <0.243.0> comprehension_binary:'-list_generator_in_bc/0-lbc$^0/2-0-'([{213,45,132},{64,76,32},{76,0,0},{234,32,15}], <<>>)

7:6:32.205854 <0.243.0> comprehension_binary:'-list_generator_in_bc/0-lbc$^0/2-0-'([{64,76,32},{76,0,0},{234,32,15}], <<213,45,132>>)

7:6:32.205976 <0.243.0> comprehension_binary:'-list_generator_in_bc/0-lbc$^0/2-0-'([{76,0,0},{234,32,15}], <<213,45,132,64,76,32>>)

7:6:32.206104 <0.243.0> comprehension_binary:'-list_generator_in_bc/0-lbc$^0/2-0-'([{234,32,15}], <<213,45,132,64,76,32,76,0,0>>)

7:6:32.206230 <0.243.0> comprehension_binary:'-list_generator_in_bc/0-lbc$^0/2-0-'([], <<213,45,132,64,76,32,76,0,0,234,32,15>>)

7:6:32.206401 <0.243.0> comprehension_binary:'-list_generator_in_bc/0-lbc$^0/2-0-'/2 --> <<213,45,132,64,76,32,76,0,0,234,32,15>>

7:6:32.207007 <0.243.0> comprehension_binary:'-list_generator_in_bc/0-lbc$^0/2-0-'/2 --> <<213,45,132,64,76,32,76,0,0,234,32,15>>

7:6:32.207583 <0.243.0> comprehension_binary:'-list_generator_in_bc/0-lbc$^0/2-0-'/2 --> <<213,45,132,64,76,32,76,0,0,234,32,15>>

7:6:32.208156 <0.243.0> comprehension_binary:'-list_generator_in_bc/0-lbc$^0/2-0-'/2 --> <<213,45,132,64,76,32,76,0,0,234,32,15>>

7:6:32.208281 <0.243.0> comprehension_binary:'-list_generator_in_bc/0-lbc$^0/2-0-'/2 --> <<213,45,132,64,76,32,76,0,0,234,32,15>>

7:6:32.208379 <0.243.0> comprehension_binary:list_generator_in_bc/0 --> <<213,45,132,64,76,32,76,0,0,234,32,15>>

7:6:32.208471 <0.243.0>  '--> erl_eval:do_apply/7
