


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

   $sql = 'SELECT emp_id, emp_name, emp_salary FROM employee';
   mysql_select_db('test_db');
   $retval = mysql_query( $sql, $conn );
   
   if(! $retval ) {
      die('Could not get data: ' . mysql_error());
   }
   
   //while($row = mysql_fetch_array($retval, MYSQL_ASSOC)) {
   while($row = mysql_fetch_assoc($retval)) {
      echo "EMP ID :{$row['emp_id']}  <br> ".
         "EMP NAME : {$row['emp_name']} <br> ".
         "EMP SALARY : {$row['emp_salary']} <br> ".
         "--------------------------------<br>";
   }
   mysql_free_result($retval);

   $retval1 = mysql_query( $sql, $conn );
   while($row = mysql_fetch_array($retval1, MYSQL_NUM)) {
      echo "EMP ID1 :{$row[0]}  <br> ".
         "EMP NAME1 : {$row[1]} <br> ".
         "EMP SALARY1 : {$row[2]} <br> ".
         "+++++++++++++++++++++++++++++br>";
   }
   
   mysql_free_result($retval1);
   
   echo "Fetched data successfully\n";
   mysql_close($conn);
   echo "<br>"."after close conn: ".$conn."</br>";
?>
