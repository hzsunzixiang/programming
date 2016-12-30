
DIR=`pwd`
find -L $DIR -name "*.h" -o -name "*.cpp" > $DIR/cscope_home.files
cscope -bq -i $DIR/cscope_home.files  -f cscope_home.out

