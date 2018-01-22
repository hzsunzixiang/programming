
<?php
   $dbhost = 'localhost';
   $dbuser = 'root';
   $dbpass = '';
   
   $backup_file = $dbname . date("Y-m-d-H-i-s") . '.gz';
   //$command = "mysqldump --opt -h $dbhost -u $dbuser -p $dbpass ". "test_db | gzip > $backup_file";
   $command = "mysqldump --opt -h $dbhost -u $dbuser ". "test_db | gzip > $backup_file";
   echo "command: ".$command;
   
   system($command);
?>
