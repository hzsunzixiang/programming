


<?php
   
   $dbhost = 'localhost:3306';
   $dbuser = 'root';
   $dbpass = '';
   $conn = mysql_connect($dbhost, $dbuser, $dbpass);
   
   if(! $conn ) {
   	  echo 'Could Connected successfully';
      die('Could not connect: ' . mysql_error());
   }
   
   echo 'Connected successfully';
   
   echo "<br>"."conn: ".$conn."</br>";

   if (mysql_select_db( 'test_db' ))
   {
      echo "mysql_select_db successfully";
   }
   else
   {
      echo "mysql_select_db fail";
      exit('Could not select database: ' . mysql_error());
   }

   $sql = 'DROP TABLE employee';
   $retval = mysql_query( $sql, $conn );
   
   if(! $retval ) {
      die('Could not delete table employee: ' . mysql_error());
   }
   
   echo "Table deleted successfully\n";

   mysql_close($conn);
   echo "<br>"."after close conn: ".$conn."</br>";
?>
