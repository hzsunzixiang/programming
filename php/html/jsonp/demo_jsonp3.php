<?php

#demo_jsonp3.php


$fun = $_GET["callback"];


$myJSON = '{ "name":"John", "age":30, "city":"New York" }';

echo "$fun(".$myJSON.");";

?>
