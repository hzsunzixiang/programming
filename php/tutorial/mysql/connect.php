#!/usr/bin/php -q
<html>

   <head>
      <title>Reading a file using PHP</title>
   </head>
   
   <body>
      
    <?php
       define('DB_SERVER', '192.168.97.200');
       define('DB_USERNAME', 'p1018texas');
       define('DB_PASSWORD', 'texas_test');
       define('DB_DATABASE', 'p1018_texas_server');
       $db = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE);
# 不连数据库无法验证
# HOST=192.168.97.200
# PARSSWORD=texas_test
# PORT=3388
# SOCKET=/tmp/mysql.sock
# USER=p1018texas
# DB=p1018_texas_server
    ?>
      
   </body>
</html>
