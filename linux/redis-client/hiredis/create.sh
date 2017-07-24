
DIR=`pwd;`
#set -x

FILE="$DIR/adapters $DIR/examples"

find -L .  $FILE -name "*.h"  -o -name "*.c" > cscope_my.files

cscope -bkq -i cscope_my.files  -f cscope_my.out

for i in $FILE
do
	cp .vimrc $i
done


ctags -R  *.c *.h
