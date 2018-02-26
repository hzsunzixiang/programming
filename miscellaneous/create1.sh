DIR=/home/StephenSun/workspace

#find -L  $DIR/BoyaaShuffler/BoyaaShuffler $DIR/BoyaaShuffler/ShufflerTest $DIR/bpt_dev/Common $DIR/bpt_dev/Cmd $DIR/bpt_dev/Framework $DIR/bpt_dev/GameLib  $DIR/old_texas/TexasServer $DIR/old_texas/AccessServer $DIR/old_texas/StateServer $DIR/old_texas/CMSServer  -name "*.hpp" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.proto" -o -name "*.lua" > cscope_my.files

DIRNAME="$DIR/cppserver/TexasServer $DIR/cppserver/texaslib"
find -L  $DIR/cppserver/TexasServer $DIR/cppserver/texaslib  $DIR/cppserver/AccessServer $DIR/cppserver/CMSServer $DIR/cppserver/StateServer $DIR/develop/Common $DIR/develop/Cmd $DIR/develop/External $DIR/develop/Framework $DIR/develop/GameLib -name "*.hpp" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.cc" -o -name "*.proto" -o -name "*.lua" > cscope_my.files

cscope -bkq -i cscope_my.files  -f cscope_my.out

for i in $DIR/cppserver/TexasServer $DIR/cppserver/texaslib $DIR/cppserver $DIR/develop/Common $DIR/develop/Cmd $DIR/develop/External $DIR/develop/Framework $DIR/develop/GameLib  $DIR/develop $DIR/cppserver/AccessServer  $DIR/cppserver/CMSServer $DIR/cppserver/StateServer $DIR/develop/Common
do
	echo $i
	cp .vimrc $i -rf
done 

#silent !find .  -name "*.cpp" -o -name "*.h" |xargs ctags -R

#find /home/StephenSun/workspace/cppserver -name "*.cpp" -o -name "*.h" |xargs ctags -R
######
#  碰到的问题 ， 目录忘了添加  还有父目录的.vimrc 要拷贝
#
#
#
#
#
#
