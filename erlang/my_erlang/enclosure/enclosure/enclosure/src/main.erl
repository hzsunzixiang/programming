-module(main).
-compile(export_all).
-compile(nowarn_export_all).


start()->
    %SIF = enclosure:start_infrastructure_fun(hello, self(), network),
    SIF = enclosure_sup:start_infrastructure_fun(hello, self(), network),
    SIF(sock, connName),
    ok.
