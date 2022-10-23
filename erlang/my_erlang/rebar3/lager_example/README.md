lager_example
=====

true

Build
-----

    $ rebar3 compile


pr/2
pr(Record, Module) -> any()

Print a record or a list of records lager found during parse transform

pr/3
pr(Record, Module, Options) -> any()

Print a record or a list of records lager found during parse transform

log/3
log(Level::log_level(), Pid::pid() | atom() | [tuple(), ...], Message::list()) -> ok | {error, lager_not_running}

Manually log a message into lager without using the parse transform.

log/4
log(Level::log_level(), Pid::pid() | atom() | [tuple(), ...], Format::string(), Args::list()) -> ok | {error, lager_not_running}

Manually log a message into lager without using the parse transform.
