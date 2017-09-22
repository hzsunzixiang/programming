gcc -o example  -I.. example.c  ../libhiredis.a 
gcc -o exmple-libevent -I.. example-libevent.c  ../libhiredis.a  -levent
