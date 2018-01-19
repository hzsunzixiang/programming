#!/usr/bin/php -q
<html>
   <body>
      
      <?php
         /* First method to associate create array. */
         $salaries = array("mohammad" => 2000, "qadir" => 1000, "zara" => 500, "test" => "hello,world");
         
         echo "Salary of mohammad is ". $salaries['mohammad'] . "<br />\n";
         echo "Salary of qadir is ".  $salaries['qadir']. "<br />\n";
         echo "Salary of zara is ".  $salaries['zara']. "<br />\n";
         echo "Salary of test is ".  $salaries['test']. "<br />\n";
         
         /* Second method to create array. */
         $salaries['mohammad'] = "high";
         $salaries['qadir'] = "medium";
         $salaries['zara'] = "low";
         
         echo "Salary of mohammad is ". $salaries['mohammad'] . "<br />\n";
         echo "Salary of qadir is ".  $salaries['qadir']. "<br />\n";
         echo "Salary of zara is ".  $salaries['zara']. "<br />\n";
      ?>
   
   </body>
</html>
