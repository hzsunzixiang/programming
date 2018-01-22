<?php
   if( $_GET["name"] || $_GET["age"] ) {
      echo "Welcome ". $_GET['name']. "<br />";
      echo "You are ". $_GET['age']. " years old.";
      
      exit();
   }
?>
<html>
   <body>
   
      <form method = "GET">
         Name: <input type = "text" name = "name" value="hello"/>
         Age: <input type = "text" name = "age" value="18"/>
         <input type = "submit" />
      </form>
      
   </body>
</html>
