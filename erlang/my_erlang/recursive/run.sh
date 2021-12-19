

#!/bin/bash
erlc  fac.erl
erl -s fac start -noshell -s init stop
