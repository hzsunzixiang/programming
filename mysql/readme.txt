stephensun@debian:~/programming/mysql$ mysql_config --cflags --libs
-I/usr/include/mysql -DBIG_JOINS=1  -fno-strict-aliasing    -g -DNDEBUG
-L/usr/lib/x86_64-linux-gnu -lmysqlclient -lpthread -lz -lm -ldl





stephensun@debian:~/programming/mysql$ mysql -uroot -p123456  testdb -e "CREATE TABLE Images(Id INT PRIMARY KEY, Data MEDIUMBLOB);"
stephensun@debian:~/programming/mysql$ mysql -uroot -p123456  testdb -e "show tables;"
tephensun@debian:~/programming/mysql$ mysql -uroot -p123456  testdb -e "select count(*) from Images;"
+----------+
| count(*) |
+----------+
|        1 |
+----------+

