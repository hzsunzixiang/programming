

执行步骤
# 启动监控 ./start_monitor.sh -d <duaration>  -p <pid> -f <directory>
./start_monitor.sh -d 1  -p `ps aux |grep ping |grep -v grep |awk '{print $2}'` -f log_test
# 停止监控
./stop_monitor.sh
# 统计数据
./statistics.sh  -f log_test 


# 查看数据
	查看生成的png图片
