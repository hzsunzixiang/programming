<?php
   if( $_GET["name"] || $_GET["age"] ) {
      echo "Welcome ". $_GET['name']. "<br />";
      echo "You are ". $_GET['age']. " years old.";
      
      exit();
   }
   //在输入框的name中输入以下语句  <script>alert("My");</script>
   // 就能看到xss攻击的情况
   // 有的浏览器比如chrome 已经阻止了会报错
   // 而火狐和IE上能够验证出来
?>
<html>
   <body>
   
      <form method = "GET">
         Name: <input type = "text" name = "name" value="hello"/>
         Age: <input type = "text" name = "age" value="18"/>
         <input type = "submit" />
      </form>
      
   </body>
</html>
