#!/usr/bin/php -q
<html>
   
   <head>
      <title>Passing Argument by Reference</title>
   </head>
   
   <body>
      
      <?php
         function addFive($num) {
            $num += 5;
         }
         
         function addSix(&$num) {
            $num += 6;
         }
         
         $orignum = 10;
         addFive( $orignum );
         
         echo "Original Value is $orignum<br />\n";
         
         addSix( $orignum );
         echo "Original Value is $orignum<br />\n";
      ?>
      
   </body>
</html>
