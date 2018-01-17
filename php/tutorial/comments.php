#!/usr/bin/php -q
<?php
   $somevar = 15;
   
   function addit() {
      GLOBAL $somevar;
      $somevar++;
      
      print "Somevar is $somevar\n";
   }
   
   addit();
?>
