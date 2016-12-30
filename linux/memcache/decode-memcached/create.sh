

DIR=`pwd`
find -L ${DIR} -name "*.h" -o -name "*.c" > $DIR/cscope_memcached.files
cscope -bq -i cscope_memcached.files  -f cscope_memcached.out

