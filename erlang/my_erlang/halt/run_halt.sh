

#!/bin/bash
erlc  fac.erl
#erl -run fac start -noshell -s init stop
erl -run fac start -noshell 
#代码中含有	   erlang:halt(0).
