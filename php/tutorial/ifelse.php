#!/usr/bin/php -q
<html>
   <body>
   
      <?php
         $d = date("D");
         
         if ($d == "Fri")
            echo "Have a nice weekend!"; 
         
         else
            echo "Have a nice day!"; 
      ?>
   
   </body>
</html>
