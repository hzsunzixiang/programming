#!/usr/bin/php -q
<html>
   
   <head>
      <title>Hello World</title>
   </head>
   
   <body>
      <?php 
	  $int_var = 12345;
	  $another_int = -12345 + 12345;
	  echo "int_var:", $int_var;


	  $many = 2.2888800;
	  $many_2 = 2.2111200;
	  $few = $many + $many_2;

	  print("$many + $many_2 = $few <br>\n");

	  if (TRUE)
	  	print("This will always print<br>");
	  else
	  	print("This will never print<br>");

	  ?>
   </body>

</html>




