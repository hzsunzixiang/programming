CURDIR=`pwd`
DIR=`pwd`


find -L $DIR/apps $DIR/boringssl $DIR/crypto $DIR/demos $DIR/engines $DIR/external $DIR/fuzz $DIR/include $DIR/krb5 $DIR/ms $DIR/pyca-cryptography $DIR/test $DIR/tools $DIR/util $DIR/VMS  -name "*.hpp" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" > cscope_my.files

cscope -bkq -i cscope_my.files  -f cscope_my.out

for i in  $DIR/apps $DIR/boringssl $DIR/crypto $DIR/demos $DIR/engines $DIR/external $DIR/fuzz $DIR/include $DIR/krb5 $DIR/ms $DIR/pyca-cryptography $DIR/test $DIR/tools $DIR/util $DIR/VMS  
do 
	cp .vimrc	$i/
done


