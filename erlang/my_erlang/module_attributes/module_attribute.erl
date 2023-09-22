-module(module_attribute). 
-author("TutorialPoint"). 
-version("1.0"). 
-module_description("This is an example module.").
-export([start/0]). 

start() -> 
   io:fwrite("Hello World\n"),
    {ok, Binary} = file:read_file("module_attribute.beam"),
    {ok, {_, Attributes}} = beam_lib:chunks(Binary, [attributes]),
    io:format("~p~n", [Attributes]),
    finish.



%2> module_attribute:module_info().
%[{module,module_attribute},
% {exports,[{start,0},{module_info,0},{module_info,1}]},
% {attributes,[{vsn,[157813916183481096809969140219602703786]},
%              {author,"TutorialPoint"},
%              {version,"1.0"}]},
% {compile,[{version,"8.4"},
%           {options,[]},
%           {source,"/home/ericksun/programming/erlang/my_erlang/module_attributes/module_attribute.erl"}]},
% {md5,<<118,185,218,204,110,124,15,162,223,162,71,152,
%        238,250,149,170>>}]
%
