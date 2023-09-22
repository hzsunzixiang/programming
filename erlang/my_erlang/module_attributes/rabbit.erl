-module(rabbit). 
-author("TutorialPoint"). 
-version("1.0"). 
-module_description("This is an example module.").
-rabbit_boot_step({pre_boot, [{description, "rabbit boot start"}]}).
-rabbit_boot_step({codec_correctness_check,
                   [{description, "codec correctness check"},
                    {mfa,         {rabbit_binary_generator,
                                   check_empty_frame_size,
                                   []}},
                    {requires,    pre_boot},
                    {enables,     external_infrastructure}]}).

-export([start/0]). 
-export([start1/0]). 

start() -> 
   io:fwrite("Hello World\n"),
   ModuleInfo = rabbit:module_info(),
   Attributes = rabbit:module_info(attributes),
   io:format("~p~n", [Attributes]),
   finish.

start1() -> 
   io:fwrite("Hello World\n"),
   {ok, Binary} = file:read_file("rabbit.beam"),
   {ok, {_, Attributes}} = beam_lib:chunks(Binary, [attributes]),
   io:format("~p~n", [Attributes]),
   finish.


%
% Any module attribute can be specified. 
% The attributes are stored in the compiled code and can be retrieved by calling Module:module_info(attributes), 
% or by using the module beam_lib(3) in STDLIB.
% 看的出来，这里是叠加的
%[{attributes,
%     [{author,"TutorialPoint"},
%      {module_description,"This is an example module."},
%      {rabbit_boot_step,
%          [{pre_boot,[{description,"rabbit boot start"}]},
%           {codec_correctness_check,
%               [{description,"codec correctness check"},
%                {mfa,{rabbit_binary_generator,check_empty_frame_size,[]}},
%                {requires,pre_boot},
%                {enables,external_infrastructure}]}]},
%      {version,"1.0"},
%      {vsn,[222772051176411506668136247394978656499]}]}]

