
<?php
   $dbhost = 'localhost:3306';
   $dbuser = 'root';
   $dbpass = '';
   
   $conn = mysql_connect($dbhost, $dbuser, $dbpass);
   
   if(! $conn ) {
      die('Could not connect: ' . mysql_error());
   }
	
   $table_name = "employee";
   $backup_file  = "/tmp/employee.sql";
   $sql = "LOAD DATA INFILE '$backup_file' INTO TABLE $table_name";
   
   mysql_select_db('test_db');
   $retval = mysql_query( $sql, $conn );
   
   if(! $retval ) {
      die('Could not load data : ' . mysql_error());
   }
   echo "Loaded  data successfully\n";
   
   mysql_close($conn);
?>
