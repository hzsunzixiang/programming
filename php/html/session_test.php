



<?php
   ///session.save_path = "/var/lib/php/session"
	
   session_start();

   echo "the cookie: <br/>";
   print_r($_COOKIE);
   echo  "<br />";
   
   if( isset( $_SESSION['counter'] ) ) {
      $_SESSION['counter'] += 1;
   }else {
      $_SESSION['counter'] = 1;
   }

   if( isset( $_SESSION['hello'] ) ) {
   }else {
      $_SESSION['hello'] = "world";
   }
	
   $msg = "You have visited this page ".  $_SESSION['counter'];
   $msg .= "in this session.";
   //session_destroy();
?>

<html>
   
   <head>
      <title>Setting up a PHP session</title>
   </head>
   
   <body>
      <?php  echo ( $msg ); ?>
   </body>
   
</html>
