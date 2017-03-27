# 直接在命令行运行 脚本不行
echo 'probe timer.s(1) { printf("read performed\n");exit()}' | stap -v -

# 这个可以  可能是 脚本中包含双引号
echo "probe timer.s(1) {exit()}" | stap -v -
#echo 'probe timer.s(1) { printf("read performed\\n");exit()}' | stap -v -

