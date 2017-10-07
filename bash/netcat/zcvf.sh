
# 监听的一方 接受数据
StephenSun@debian-1:~/programming/bash/netcat$ netcat -l -p 7777 |tar zxvf - -C xx                                                                 
1/
1/x
1/2/

# 发送的一方
StephenSun@debian-1:~/programming/bash/netcat$ tar zcvf - * |netcat 127.0.0.1 7777                                                                 
1/
1/x



