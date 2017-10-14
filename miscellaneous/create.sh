DIR=/home/StephenSun/workspace

#find -L $DIR/AccessServer $DIR/Cmd $DIR/External $DIR/Framework $DIR/GameLib -name "*.hpp" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.proto" -o -name "*.lua" > cscope_my.files
#find -L $DIR/bpt_dev/AccessServer $DIR/bpt_dev/Cmd $DIR/bpt_dev/Framework $DIR/bpt_dev/GameLib -name "*.hpp" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.proto" -o -name "*.lua" > cscope_my.files
find -L  $DIR/BoyaaShuffler/BoyaaShuffler $DIR/BoyaaShuffler/ShufflerTest $DIR/bpt_dev/Common $DIR/bpt_dev/Cmd $DIR/bpt_dev/Framework $DIR/bpt_dev/GameLib  $DIR/old_texas/TexasServer $DIR/old_texas/AccessServer $DIR/old_texas/StateServer $DIR/old_texas/CMSServer  -name "*.hpp" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.proto" -o -name "*.lua" > cscope_my.files

cscope -bkq -i cscope_my.files  -f cscope_my.out

for i in   $DIR/BoyaaShuffler/BoyaaShuffler $DIR/BoyaaShuffler/ShufflerTest $DIR/bpt_dev/Common $DIR/bpt_dev/Cmd $DIR/bpt_dev/Framework $DIR/bpt_dev/GameLib  $DIR/old_texas/TexasServer $DIR/old_texas/AccessServer $DIR/old_texas/StateServer $DIR/old_texas/CMSServer  
do
	echo $i
	cp .vimrc $i -rf
done 


