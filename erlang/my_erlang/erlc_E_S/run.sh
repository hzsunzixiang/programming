

#!/bin/bash
erlc  hello.erl
erlc -E  hello.erl
erlc -S  hello.erl
erl -s hello  helloworld -noshell -s init stop
