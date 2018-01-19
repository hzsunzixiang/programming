#!/usr/bin/php -q
<?php
   $variable = "name";
   $literally = 'My $variable will not print!\\n';
   
   print($literally);
   print "<br />\n";
   
   $literally = "My $variable will print!\\n";
   
   print($literally);


   echo "\n";
  // To concatenate two string variables together, use the dot (.) operator −
   $string1="Hello World";
   $string2="1234";
   
   echo $string1 . "###" . $string2;

   echo "\n";
   echo "9"."###" . 10000;

   echo "\n\n";
   echo strlen("Hello world!")."\n";

   echo strpos("Hello world!","world")."\n";
?>
