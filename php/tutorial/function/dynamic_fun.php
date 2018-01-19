#!/usr/bin/php -q
<html>
   
   <head>
      <title>Dynamic Function Calls</title>
   </head>
   
   <body>
      
      <?php
         function sayHello() {
            echo "Hello<br />";
         }
         
         $function_holder = "sayHello";
		 // 不加引号 作为常量处理了  PHP Notice:  Use of undefined constant sayHello - assumed 'sayHello' in /home/StephenSun/programming/php/tutorial/function/dynamic_fun.php on line 16
         //$function_holder = sayHello;
         $function_holder();
      ?>
      
   </body>
</html>
