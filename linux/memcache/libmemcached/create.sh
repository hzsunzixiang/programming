

DIR=`pwd`
find -L ${DIR} -name "*.h" -o -name "*.c" > $DIR/cscope_memcache.files
#cscope -bkq -i cscope_memcache.files  -f cscope_memcache.out
cscope -bq -i cscope_memcache.files  -f cscope_memcache.out

