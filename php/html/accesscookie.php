<html>
   
   <head>
      <title>Accessing Cookies with PHP</title>
   </head>
   
   <body>
      
      <?php
         echo $_COOKIE["name"]. "<br />";
         
         /* is equivalent to */
         echo $HTTP_COOKIE_VARS["name"]. "<br />";
         
         echo $_COOKIE["age"] . "<br />";
         
         /* is equivalent to */
         echo $HTTP_COOKIE_VARS["age"] . "<br />";

			 // 判断
		 if( isset($_COOKIE["name"]))
            echo "Welcome " . $_COOKIE["name"] . "<br />";
         
         else
            echo "Sorry... Not recognized" . "<br />";

	     echo "<a href='delete_cookie.php'>deletecookie</a>"
      ?>
      
   </body>
</html>
