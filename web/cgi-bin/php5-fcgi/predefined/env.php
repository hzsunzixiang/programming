<?php

echo 'My env is ' ;
print_r($_SERVER);
#echo 'My username is ' .$_ENV["USER"] . '!';

function test() {
	$foo = "local variable";

	echo '$foo in global scope: ' . $GLOBALS["foo"] . "\n";
	echo '$foo in current scope: ' . $foo . "\n";
}

$foo = "Example content";
test();


?>
