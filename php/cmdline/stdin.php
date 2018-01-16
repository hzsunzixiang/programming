#!/usr/bin/php -q
<?php
$file = file_get_contents("php://stdin", "r");
echo $file;
// This code should act much like cat, echoing back all input given to it. However, it will not accept arguments at this time.
?>
