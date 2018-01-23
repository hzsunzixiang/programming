


# 当不能  以home目录作为 web根目录的时候 

要关闭防火墙
而且权限要对

stephensun@centos-1:~/programming/web$ ll -lhd /home/
drwxr-xr-x. 4 root root 4.0K Jun 27  2017 /home/
stephensun@centos-1:~/programming/web$ ll -lhd /home/stephensun/
drwxr-xr-x. 11 stephensun root 4.0K Jan 23 17:05 /home/stephensun/
 

stephensun@centos-1:~/programming/web$ sudo getenforce
Enforcing
stephensun@centos-1:~/programming/web$ sudo setenforce Permissive
stephensun@centos-1:~/programming/web$ sudo getenforce
Permissive

