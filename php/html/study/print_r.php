<pre>
	<?php
        // bool print_r ( mixed $expression [, bool $return ] )
		$a = array ('a' => 'apple', 'b' => 'banana', 'c' => array ('x','y','z'));
		$ret = print_r ($a);
        echo "ret: ".$ret;

        // 如果想捕捉 print_r() 的输出，可使用 return 参数。若此参数设为 TRUE，print_r() 将不打印结果（此为默认动作），而是返回其输出。 
		$results = print_r ($a, true); //$results 包含了 print_r 的输出结果
		echo "result ".$results;
	?>
</pre> 




