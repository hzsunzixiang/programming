ericksun@centos7-mq1:~/programming/linux/readlink (master)$ ln -s test.txt test_1.txt
ericksun@centos7-mq1:~/programming/linux/readlink (master)$ ll -lh
total 0
lrwxrwxrwx. 1 ericksun ericksun 8 Oct  5 03:41 test_1.txt -> test.txt
-rw-rw-r--. 1 ericksun ericksun 0 Oct  5 03:40 test.txt
ericksun@centos7-mq1:~/programming/linux/readlink (master)$ readlink -f test_1.txt
/home/ericksun/programming/linux/readlink/test.txt
ericksun@centos7-mq1:~/programming/linux/readlink (master)$ ln -s test_1.txt  test_2.txt
ericksun@centos7-mq1:~/programming/linux/readlink (master)$ readlink -f test_2.txt
/home/ericksun/programming/linux/readlink/test.txt
ericksun@centos7-mq1:~/programming/linux/readlink (master)$ readlink  test_2.txt
test_1.txt
ericksun@centos7-mq1:~/programming/linux/readlink (master)$ readlink -f test_1.txt
/home/ericksun/programming/linux/readlink/test.txt
ericksun@centos7-mq1:~/programming/linux/readlink (master)$ readlink  test_1.txt
test.txt

