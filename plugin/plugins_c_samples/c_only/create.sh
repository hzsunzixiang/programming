
DIR=~/programming/plugin/plugins_c_samples/c_only

find -L $DIR $DIR/clib $DIR/plugins -name "*.h" -o -name "*.c" > $DIR/cscope_source.files
cscope -bq -i $DIR/cscope_source.files  -f cscope_source.out


ctags -R *.h *.c

FILE="$DIR/clib $DIR/plugin"

for i in $FILE
do
	cp .vimrc $i
done

