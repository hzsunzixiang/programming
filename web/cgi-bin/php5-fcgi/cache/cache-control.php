<html><body><h1>It works!</h1>
<p>This is the default web page for this server.</p>
<p>The web server software is running but no content has been added, yet.</p>

<?php

#Cache-control: max-age=5


# 注意Cache-Control 是对request来说的
# 在firefox上起作用  但是对chrome好像不起作用
#header('Cache-Control: no-cache, no-store, max-age=0, must-revalidate');   
header('Cache-Control: max-age=5000');   
# head 必须在前面

# 跳转
header('Refresh: 3; url=http://192.168.1.102/index.html');   

# 不起作用 在apache配置中其作用
#header("Keep-Alive:timeout=2, max=50");
echo "helloworld"
#echo 'My env is ' ;
##print_r($_SERVER);
##echo 'My username is ' .$_ENV["USER"] . '!';
#
#function test() {
#	$foo = "local variable";
#
#	echo '$foo in global scope: ' . $GLOBALS["foo"] . "\n";
#	echo '$foo in current scope: ' . $foo . "\n";
#}
#
#$foo = "Example content";
#test();


?>
</body></html>
