


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

   $sql = 'CREATE Database test_db';
   $retval = mysql_query( $sql, $conn );
   
   if(! $retval ) {
      echo "Database test_db created false \n";
      die('Could not create database: ' . mysql_error());
   }
   
   echo "Database test_db created successfully\n";
   mysql_close($conn);
   echo "<br>"."after close conn: ".$conn."</br>";
?>
