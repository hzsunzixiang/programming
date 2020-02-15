



https://www.computerhope.com/unix/udiff.htm
https://unix.stackexchange.com/questions/81998/understanding-of-diff-output

ericksun@192.168.56.101:~/programming/linux/diff (master)$ diff file1.txt  file2.txt
3d2
< line3
5a5
> GNU is not UNIX




这里的意思是 按照下面的操作 file1.txt 得到的结果就是 file2.txt
ericksun@192.168.56.101:~/programming/linux/diff (master)$ diff -u file1.txt  file2.txt
--- file1.txt   2020-02-13 09:55:00.337819599 +0800
+++ file2.txt   2020-02-13 09:54:56.361808721 +0800
@@ -1,5 +1,5 @@
 this is the original text
 line2
-line3
 line4
 happy hacking !
+GNU is not UNIX
ericksun@192.168.56.101:~/programming/linux/diff (master)$ cat file1.txt
this is the original text
line2
line3
line4
happy hacking !
ericksun@192.168.56.101:~/programming/linux/diff (master)$ cat file2.txt
this is the original text
line2
line4
happy hacking !
GNU is not UNIX

