
<?php
   if( $_POST["name"] || $_POST["age"] ) {
      if (preg_match("/[^A-Za-z'-]/",$_POST['name'] )) {
         die ("invalid name and name should be alpha");
      }
      echo "Welcome ". $_POST['name']. "<br />";
      echo "You are ". $_POST['age']. " years old.";
      
      exit();
   }
?>
<html>
   <body>
   
      <form method = "POST">
         Name: <input type = "text" name = "name" value="hello"/>
         Age: <input type = "text" name = "age" value="18"/>
         <input type = "submit" />
		<?php echo "_PHP_SELF: "; print_r($_PHP_SELF) ?>
      </form>
      
   </body>
</html>
