#http://my.oschina.net/u/554995/blog/59927

#find ~/work/..Project/ -name "*.h" -o -name "*.cpp" > cscope.files

#find /home/p_jdzxsun/workspace/ -name "*.h" -o -name "*.cpp" > ~/workspace/cscope.files

DIR=`pwd`
#FILE=`find $DIR -maxdepth 1 -type d`
echo $DIR
FILE="$DIR/protobuf $DIR/helloworld" 

find -L  $FILE -name "*.hpp" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.proto" -o -name "*.cc"  > cscope_my.files

cscope -bkq -i cscope_my.files  -f cscope_my.out

for i in $FILE 
do
	cp .vimrc $i
done
