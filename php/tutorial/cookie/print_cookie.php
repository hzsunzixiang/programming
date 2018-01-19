#!/usr/bin/php -q
<?php
    setcookie("name", "John Watkin", time()+3600, "/","", 0);
    setcookie("age", "36", time()+3600, "/", "",  0);
    echo $_COOKIE["name"]. "<br />";
    
	// 目前是命令行模式 无法打印
    // /* is equivalent to */
    // echo $HTTP_COOKIE_VARS["name"]. "<br />";
    // 
    // echo $_COOKIE["age"] . "<br />";
    // 
    // /* is equivalent to */
    // echo $HTTP_COOKIE_VARS["age"] . "<br />";
?>
<html>
   
   <head>
      <title>Setting Cookies with PHP</title>
   </head>
   
   <body>
      <?php echo "Set Cookies"?>
   </body>
   
</html>
