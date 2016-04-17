
迭代服务器 消耗的cpu的确会少一些

root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives# ./client 127.0.0.1  8889   1  10000 10000
root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives/server_iterator# ./server_iterator 127.0.0.1 8888

user time = 0.012, sys time = 0.44


fork并发服务器

root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives/server_fork# ./server_fork 127.0.0.1 8888
root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives# ./client 127.0.0.1  8888  10  1000 1000
user time = 0.08, sys time = 0.612





