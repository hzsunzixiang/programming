   默认名字： Mnesia.apple@centos7-mq1/

erl -noshell -mnesia dir '"./mnesia_store"' -sname apple -s create_tables start -s init stop
---> Processes holding locks <---
---> Processes waiting for locks <---
---> Participant transactions <---
---> Coordinator transactions <---
---> Uncertain transactions <---
---> Active tables <---
schema         : with 4        records occupying 771      words of mem
===> System info in version "4.22.1", debug level = none <===
opt_disc. Directory "/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_09/mnesia_store" is used.
use fallback at restart = false
running db nodes   = ['apple@centos7-mq1']
stopped db nodes   = []
master node tables = []
remote             = []
ram_copies         = [contributor,project,user]
disc_copies        = [schema]
disc_only_copies   = []
[{'apple@centos7-mq1',disc_copies}] = [schema]
[{'apple@centos7-mq1',ram_copies}] = [user,contributor,project]
2 transactions committed, 3 aborted, 0 restarted, 0 logged to disc
0 held locks, 0 in queue; 0 local transactions, 0 remote
0 transactions waits for other nodes: []
Contributor:[]
DirtyRead:[]
Select:{atomic,[31]}
Select2:{atomic,[20]}

