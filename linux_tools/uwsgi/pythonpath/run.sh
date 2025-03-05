


../uwsgi --daemonize2 uwsgi.log etc/uwsgi.ini



#ps aux|grep uwsgi |grep -v grep |awk '{print $2}'|xargs kill -9


#ericksun@debian:~/programming/uwsgi/master1$ ps uax|grep -v grep |grep vst
#ericksun   2768  0.0  0.2  25404  5740 ?        S    13:02   0:00 vstation-master
#ericksun   2769  0.0  0.5 101724 10328 ?        Sl   13:02   0:00 vstation-worker
#ericksun   2770  0.0  0.5 101724 10348 ?        Sl   13:02   0:00 vstation-worker

