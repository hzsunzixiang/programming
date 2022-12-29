-module(comprehension_binary).

-compile(export_all).
-compile(nowarn_export_all).

start()->
	%  binary generator in a list comprehension,
    [ X || <<X>> <= <<1,2,3,4,5>>, X rem 2 == 0],  

	%Pixels = <<213,45,132,64,76,32,76,0,0,234,32,15>>.
	%RGB = [ {R,G,B} || <<R:8,G:8,B:8>> <= Pixels ].  %  binary generator in a list comprehension,

	%  list generator in a binary comprehension 
	RGB = [{213,45,132},{64,76,32},{76,0,0},{234,32,15}],
	<< <<R:8, G:8, B:8>> ||  {R,G,B} <- RGB >>, 

	%  list generator in a binary comprehension 
	<< <<Bin/binary>> || Bin <- [<<3,7,5,4,7>>] >>, 
	%  binary generator in a binary comprehension 
	<< <<(X+1)/integer>> || <<X>> <= <<3,7,5,4,7>> >>.

list_generator_in_lc()->
	%  list generator in a list comprehension,
    [X+Y || X <- [1,2], Y <- [2,3]].

binary_generator_in_lc()->
	%  binary generator in a list comprehension,
    [ X || <<X>> <= <<1,2,3,4,5>>, X rem 2 == 0].  

list_generator_in_bc()->
	%  list generator in a binary comprehension 
	RGB = [{213,45,132},{64,76,32},{76,0,0},{234,32,15}],
	<< <<R:8, G:8, B:8>> ||  {R,G,B} <- RGB >>. 

binary_generator_in_bc()->
	%  binary generator in a binary comprehension 
	<< <<(X+1)/integer>> || <<X>> <= <<3,7,5,4,7>> >>.
