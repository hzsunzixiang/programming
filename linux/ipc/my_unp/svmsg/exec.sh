#!/bin/bash

./msgcreate /tmp/test1
./msgsnd /tmp/test1 1 100
./msgsnd /tmp/test1 2 200
./msgsnd /tmp/test1 3 300

ipcs -q

read -p "Press any key to continue." var

./msgrcv -t 200 /tmp/test1
./msgrcv -t -300 /tmp/test1
./msgrcv /tmp/test1
./msgrcv -n  /tmp/test1

ipcs -q

read -p "Press any key to continue." var


./msgsnd /tmp/test1 1 100
./msgrcv -n -t 999 /tmp/test1
grep desire /usr/include/asm-generic/errno.h

read -p "Press any key to continue." var
./msgrcv -t 999 /tmp/test1

read -p "Press any key to continue." var
./msgrmid /tmp/test1



touch /tmp/testid
./msgcreate  /tmp/testid
./msgsnd /tmp/testid 4 400
./msgrcvid -t 1 -n 98306
./msgrcvid -t 100 -n 98306
fg


