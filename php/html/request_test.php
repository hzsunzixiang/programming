
<?php
   if( $_REQUEST["name"] || $_REQUEST["age"] ) {
		// $_REQUEST 根据metho的方法 来进行
      echo "Welcome ". $_REQUEST['name']. "<br />";
      echo "You are ". $_REQUEST['age']. " years old.";
      exit();
   }
?>
<html>
   <body>
      
      <form action = "<?php $_PHP_SELF ?>" method = "POST">
         Name: <input type = "text" name = "name" value="hello"/>
         Age: <input type = "text" name = "age" value="18"/>
         <input type = "submit" />
      </form>
      
   </body>
</html>
