

#!/bin/bash
erlc  fac.erl
erl -run fac start -noshell -s init stop
