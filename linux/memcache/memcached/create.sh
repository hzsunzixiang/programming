

DIR=`pwd`
find -L ${DIR} -name "*.h" -o -name "*.c" > $DIR/cscope_memcached.files
cscope -bkq -i cscope_memcached.files  -f cscope_memcached.out

