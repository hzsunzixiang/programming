#!/usr/bin/php -q
<html>
   
   <head>
      <title>Writing PHP Function which returns value</title>
   </head>
   
   <body>
      
      <?php
         function printMe($param = NULL) {
            print $param;
         }

         function printMe1($param = "hello,world!\n") {
            print $param;
         }
         
         printMe("This is test"."\n");
         printMe();
         printMe1();
         printMe1("hoho");
      ?>
      
   </body>
</html>
