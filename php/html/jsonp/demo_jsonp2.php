<?php

#header("Content-Type: application/json; charset=UTF-8");
#$obj = json_decode($_GET["x"], false);
#
#$conn = new mysqli("myServer", "myUser", "myPassword", "Northwind");
#$result = $conn->query("SELECT name FROM ".$obj->$table." LIMIT ".$obj->$limit);
#$outp = array();
#$outp = $result->fetch_all(MYSQLI_ASSOC);
#
#echo "myFunc(".json_encode($outp).")";


#$myJSON = '{ "name":"John", "age":30, "city":"New York" }';

$myJSON = '[{"name":"Alfreds Futterkiste"},{"name":"Ana Trujillo Emparedados y helados"},{"name":"Antonio Moreno Taqueria"},{"name":"Around the Horn"},{"name":"Berglunds snabbkop"},{"name":"Blauer See Delikatessen"},{"name":"Blondel pere et fils"},{"name":"Bolido Comidas preparadas"},{"name":"Bon app"},{"name":"Bottom-Dollar Marketse"}]';

#$myJSON = '{ "name":"John", "age":30, "city":"New York" }';
echo "myFunc(".$myJSON.");";

#$myJSON = '{ "name":"John", "age":30, "city":"New York" }';
#
#echo "myFunc(".$myJSON.");";

?>
