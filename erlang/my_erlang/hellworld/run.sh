

#!/bin/bash
erlc  hello.erl
erl -s hello  helloworld -noshell -s init stop
