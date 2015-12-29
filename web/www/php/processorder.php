<html>
<head>
  <title>Bob's Auto Parts - Order Results</title>
</head>
<body>
<h1>Bob's Auto Parts</h1>
<h2>Order Results</h2>
<?php
  echo '<p>Order processed at ';
  echo date('H:i, jS F');
  echo '</p>';
  echo '<p>Your order is as follows: </p>';
  echo $tireqty.' tires<br />';
  echo $oilqty.' bottles of oil<br />';
  echo $sparkqty.' spark plugs<br />';

  $totalqty = 0;
  $totalamount = 0.00;

  $totalqty = 0;
  $totalqty = $tireqty + $oilqty + $sparkqty;
  echo 'Items ordered: '.$totalqty.'<br />';

  $totalamount = 0.00;

  define('TIREPRICE', 100);
  define('OILPRICE', 10);
  define('SPARKPRICE', 4);

  $totalamount = $tireqty * TIREPRICE
               + $oilqty * OILPRICE
               + $sparkqty * SPARKPRICE;

  echo 'Subtotal: $'.number_format($totalamount,2).'<br />';

  $taxrate = 0.10;  // local sales tax is 10%
  $totalamount = $totalamount * (1 + $taxrate);
  echo 'Total including tax: $'.number_format($totalamount,2).'<br />';

?>
<?php
//声明变量为null
$n = null;
var_dump($n);

//var_dump显示输出变量$meiyou，看看结果是什么？
var_dump($meiyou);

//声明一个变量$iphone的值为字符串的手机
$iphone = '手机';
//unset销毁掉一个变量
unset($iphone);
var_dump($iphone);

?>


<?php

 $apple = null;
  if(empty($apple)){
	       echo 'true love';
		    }else{
				    echo 'false also love';
					 }
?>
</body>
</html>

