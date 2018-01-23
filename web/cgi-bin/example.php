#!/usr/bin/php -q
<?php 
echo "Content-type: text/html";
echo "\n";
echo "\n";

echo "<html>
<head><title>What You Said</title></head>";
echo "<body>Here's what you said:";
echo "<br>";
echo "QUERY_STRING";
//echo getenv('QUERY_STRING');
echo "</br>";
echo "</body></html>";



/*
   这里直接使用php的解释器 相当于 shell c 等语言一样 
   // https://zh.wikipedia.org/wiki/%E9%80%9A%E7%94%A8%E7%BD%91%E5%85%B3%E6%8E%A5%E5%8F%A3
   另一个方法是直接把解释器放在Web服务器中，这样就无须新建一个进程来执行脚本。Apache服务器有很多这样的模块，像mod_cplusplus、mod_perl、mod_php、mod_python、mod_ruby、和mod_mono。

   */
?>
