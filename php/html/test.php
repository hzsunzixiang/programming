
<?php 
#echo "<a href='a.php?city=beijing&name=xiaomingxx'>传送数据</a>"
#echo "<a href='a.php?city=北京好&name=xiaoming'>传送数据</a>"
$str=urlencode("beijing");
$str2=urlencode("xiaomingx");
echo "<a href='a.php?city=$str&name=$str2'>send file</a>"
?>

