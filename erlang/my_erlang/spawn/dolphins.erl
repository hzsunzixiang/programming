-module(dolphins).
-compile(export_all).
-compile(nowarn_export_all).

dolphin1() ->
    receive
        do_a_flip ->
            io:format("How about no?~n");
        fish ->
            io:format("So long and thanks for all the fish!~n");
        _ ->
            io:format("Heh, we're smarter than you humans.~n")
    end.

dolphin2() ->
    receive
        {From, do_a_flip} ->
            From ! "How about no?";
        {From, fish} ->
            From ! "So long and thanks for all the fish!";
        _ ->
            io:format("Heh, we're smarter than you humans.~n")
    end.

dolphin3() ->
    receive
        {From, do_a_flip} ->
            From ! "How about no?",
            dolphin3();
        {From, fish} ->
            From ! "So long and thanks for all the fish!",
            dolphin3();
        _ ->
            io:format("Heh, we're smarter than you humans.~n"),
            dolphin3()
    end.

%start() ->
%   Dolphins = spawn(dolphins, dolphin1, []),
%   Dolphins ! "oh, hello dolphin!",
%   'this is an end'.

%start() ->
%   Dolphins = spawn(dolphins, dolphin1, []),
%   Dolphins ! fish,
%   'this is an end'.
%start() ->
%   Dolphins2 = spawn(dolphins, dolphin2, []),
%   %Dolphins2 ! {self(), do_a_flip},
%   Dolphins2 ! {self(), fish},
%   'this is an end'.
%
%
%接受信息的时候是穿插着来的，接受消息不确定?
receive_from_dophine() ->
    receive
        Msg ->
            io:format("message from dophine:~p~n", [Msg])
    end,
    receive_from_dophine().

start() ->
   Dolphins3 = spawn(dolphins, dolphin3, []),
   Dolphins3 ! {self(), do_a_flip},
   Dolphins3 ! {self(), do_a_flip},
   Dolphins3 ! {self(), do_a_flip},
   Dolphins3 ! {self(), do_a_flip},
   %Dolphins3 ! {self(), unknown_messange},
   %Dolphins3 ! {self(), unknown_messange},
   %Dolphins3 ! {self(), unknown_messange},
   %Dolphins3 ! {self(), unknown_messange},
   %Dolphins3 ! {self(), unknown_messange},
   Dolphins3 ! {self(), fish},
   Dolphins3 ! {self(), fish},
   Dolphins3 ! {self(), fish},
   receive_from_dophine(),
   'this is an end'.



