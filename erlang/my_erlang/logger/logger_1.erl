-include_lib("kernel/include/logger.hrl").

-module(logger_1).
-compile([export_all]).
-compile(nowarn_export_all).


start() ->
    Reason="HelloWorld",
    ?LOG_ERROR("macro error happened because: ~p", [Reason]),   % With macro
    logger:error("error happened because: ~p", [Reason]), % Without macro
    'this is an end'.
