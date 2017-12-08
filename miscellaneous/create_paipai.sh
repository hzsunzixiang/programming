DIR=/home/StephenSun/workspace_paipai

#appPlatform platform_proj

find -L  $DIR/appPlatform/my_ao/ao_helloworld/helloworldaos/src/ $DIR/appPlatform/my_ao $DIR/appPlatform/my_ao/ao_helloworld $DIR/appPlatform/my_dao/ $DIR/appPlatform/my_dao/helloworlddaos $DIR/platform_proj/container3 $DIR/platform_proj -name "*.hpp" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.proto" -o -name "*.lua" > cscope_my.files

cscope -bkq -i cscope_my.files  -f cscope_my.out

for i in  $DIR/appPlatform/my_ao/ao_helloworld/helloworldaos/src/ $DIR/appPlatform/my_ao/ao_helloworld $DIR/appPlatform/my_dao/ $DIR/appPlatform/my_dao/helloworlddaos $DIR/platform_proj/container3 $DIR/appPlatform/ $DIR/platform_proj/ 
do
	echo $i
	cp .vimrc $i -rf
done 


