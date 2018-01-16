#!/usr/bin/php -q
<?php
$STDOUT = fopen("php://stdout", "w");
fwrite($STDOUT, "Output #1.");
fclose($STDOUT);

$STDERR = fopen("php://stderr", "w");
fwrite($STDERR, "Output #2.");
fclose($STDERR);
// 需要先打开 不然报错
// fwrite($STDERR, "Output #3.");
// The above code explicitly opens php://stdout as an output channel, and php://output generally acts the same way as php://stdout. Recent versions of PHP can use STDOUT as a constant instead of defining the variable $STDOUT used above.
?>
