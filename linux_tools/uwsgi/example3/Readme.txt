

nginx conf


/etc/nginx/sites-available/default

    location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.

        #uwsgi_buffers 64 64k;
        #uwsgi_buffer_size 64k;

        include uwsgi_params;
        #uwsgi_pass 127.0.0.1:3031;
        uwsgi_pass unix:///tmp/uwsgi.sock;
    }



注意权限，uwsgi.sock 的权限，可以修改nginx的启动用户
user ericksun;
