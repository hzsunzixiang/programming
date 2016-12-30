

DIR=`pwd`
find -L ${DIR} -name "*.h" -o -name "*.c" > $DIR/cscope_redis.files
cscope -bq -i cscope_redis.files  -f cscope_redis.out

