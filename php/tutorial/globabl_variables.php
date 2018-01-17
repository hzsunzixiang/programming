#!/usr/bin/php -q
<?php
   $somevar = 15;
   
   function addit() {
	   // 如果注释掉
	   //PHP Notice:  Undefined variable: somevar in /home/StephenSun/programming/php/tutorial/globabl_variables.php on line 7
	   // Somevar is 1

      GLOBAL $somevar;
      $somevar++;
      
      print "Somevar is $somevar\n";
   }
   
   addit();


	function addit1()
	{
		GLOBAL $somevar;
		$somevar++;
		print "somevar is $somevar\n";

	}
   addit1();
?>
