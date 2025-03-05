

http://www.bjhee.com/apache-wsgi.html



# 安装
 sudo apt-get install libapache2-mod-wsgi

# 确认
 ericksun@debian:/etc/nginx/sites-available$ sudo /usr/sbin/apachectl -M


 ericksun@debian:/etc/apache2/mods-enabled$ sudo /usr/sbin/apachectl -M |grep wsg
  wsgi_module (shared)


# 部署

cp test.wsgi /var/www/html

<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port that
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the request's Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with "a2disconf".
        #Include conf-available/serve-cgi-bin.conf

        WSGIScriptAlias /test /var/www/html/test.wsgi
</VirtualHost>




# 测试

	http://192.168.247.135/test



