
# 按以下步骤 在两个bash里面执行
PORT=9999
nc -l -p $PORT < ~/.bashrc

cat < /dev/tcp/127.0.0.1/$PORT 
