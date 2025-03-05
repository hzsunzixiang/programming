


../uwsgi --daemonize2 uwsgi.log etc/uwsgi.ini



#ps aux|grep uwsgi |grep -v grep |awk '{print $2}'|xargs kill -9
