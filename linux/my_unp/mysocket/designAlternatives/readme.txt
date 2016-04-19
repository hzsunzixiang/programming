每次测试  数据不太稳定
迭代服务器 消耗的cpu的确会少一些

root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives# ./client 127.0.0.1  8889   1  10000 10000
root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives/server_iterator# ./server_iterator 127.0.0.1 8888

user time = 0.036, sys time = 0.412


fork并发服务器

root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives/server_fork# ./server_fork 127.0.0.1 8888
root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives# ./client 127.0.0.1  8888  10  1000 10000
user time = 0.08, sys time = 0.612


预先派生子进程

root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives/server_prefork# ./server_prefork_meter 127.0.0.1 8888 10
root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives# ./client 127.0.0.1  8888   10  1000 10000

user time = 0.024, sys time = 0.412
child 0, 1017 connections
child 1, 1054 connections
child 2, 1017 connections
child 3, 1039 connections
child 4, 985 connections
child 5, 1051 connections
child 6, 851 connections
child 7, 1088 connections
child 8, 887 connections
child 9, 1011 connections



目前内核已经没有accept的惊群效应了 进程多的时候 反而也很快

root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives/server_prefork# ./server_prefork_meter  127.0.0.1 8888 1000
user time = 0, sys time = 0.228


accept文件加锁

root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives/server_prefork_flock# ./server_prefork_flock 127.0.0.1 9999 10
user time = 0.052, sys time = 0.404


accept线程上锁
root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives/server_prefork_pthread# ./server_prefork_pthread 127.0.0.1 8888 10


user time = 0.072, sys time = 0.36


文件描述符传递
root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/designAlternatives/server_fd_transmit# ./server_prefork_fd 127.0.0.1 8888 10

user time = 0.04, sys time = 0.404


