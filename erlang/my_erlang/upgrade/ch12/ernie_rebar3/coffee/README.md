coffee
=====

Coffee Machine Controller

Build
-----

    $ rebar3 compile
perl -i -pe 's/0\.1\.0/1.0/' ./apps/coffee/src/coffee.app.src ./rebar.config
cp ../../coffee-1.0/src/*.erl apps/coffee/src/


