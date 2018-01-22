


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

   //$sql = 'CREATE TABLE employee( '.
   //   'emp_id INT NOT NULL AUTO_INCREMENT, '.
   //   'emp_name VARCHAR(20) NOT NULL, '.
   //   'emp_address  VARCHAR(20) NOT NULL, '.
   //   'emp_salary   INT NOT NULL, '.
   //   'join_date    timestamp(14) NOT NULL, '.
   //   'primary key ( emp_id ))';

   $query_file = 'sql_create_table.txt';
   
   $fp = fopen($query_file, 'r');
   $sql = fread($fp, filesize($query_file));
   fclose($fp); 




   if (mysql_select_db( 'test_db' ))
   {
      echo "mysql_select_db successfully";
   }
   else
   {
      echo "mysql_select_db fail";
      exit('Could not select database: ' . mysql_error());
   }
   $retval = mysql_query( $sql, $conn );
   
   if(! $retval ) {
      die('Could not create table: ' . mysql_error());
   }
   
   echo "Table employee created successfully\n";
   mysql_close($conn);
   echo "<br>"."after close conn: ".$conn."</br>";
?>
