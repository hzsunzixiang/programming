<?php
   setcookie( "name", "", time()- 60, "/","", 0);
   setcookie( "age", "", time()- 60, "/","", 0);
?>
<html>
   
   <head>
      <title>Deleting Cookies with PHP</title>
   </head>
   
   <body>
      <?php echo "Deleted Cookies" ?>
	  echo "<a href='accesscookie.php'>getcookie</a>"
   </body>
   
</html>
