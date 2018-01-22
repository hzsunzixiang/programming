


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


   $sql = 'DROP DATABASE test_db';
   $retval = mysql_query( $sql, $conn );
   
   if(! $retval ) {
      die('Could not delete database db_test: ' . mysql_error());
   }
   
   echo "Database deleted successfully\n";
   mysql_close($conn);
   echo "<br>"."after close conn: ".$conn."</br>";
?>
