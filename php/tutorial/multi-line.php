#!/usr/bin/php -q

<?php
   // # First Example
   // print <<<END
   // This uses the "here document" syntax to output
   // multiple lines with $variable interpolation. Note
   // that the here document terminator must appear on a
   // line with just a semicolon no extra whitespace!
   // END;
   
   # Second Example
   print "This spans
   multiple lines. The newlines will be
   output as well\n";
   /* This is a comment with multiline
      Author : Mohammad Mohtashim
      Purpose: Multiline Comments Demo
      Subject: PHP
   */
   
   print "An example with multi line comments\n";

$four = 2 + 2; // single spaces
$four =	2+	2 ; // spaces and tabs
$four =
2+
2; // multiple lines



$capital = 67;
print("Variable capital is $capital<br>\n");
print("Variable CaPiTaL is $CaPiTaL<br>\n");
?>
