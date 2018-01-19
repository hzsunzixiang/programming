#!/usr/bin/php -q
<?php
   define("MINSIZE", 50);
   
   echo MINSIZE;
   echo constant("MINSIZE"), "\n"; // same thing as the previous line
	
   function test() {
   		echo "int the funtion ". __FUNCTION__."\n";
   		echo "int the line ". __LINE__."\n";
   		echo "int the FILE ". __FILE__."\n";
   }
   echo "int the line ". __LINE__."\n";
   echo "int the FILE ". __FILE__."\n";
   test();
?>
