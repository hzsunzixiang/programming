#!/usr/bin/php -q
<?php  
  
// Declare an array 
$array = array (
  'FOO' => 
  array (
    'hello' => 'BAR',
    'world' => 'BAZ',
  ),
  'env' =>
  array (
    'tce' => true,
    'TCE' => 'false',
  ),
  'Key1' => 'Value1',
  'Key2' => 'Value2',
  'Key3' => 'Value3',
);
echo $array['FOO']['hello'];
echo $array['FOO']['world'];
echo "\n"; 
#// Use isset function 
echo isset($array['FOO']) ? 'array is set.' :  
    'array is not set.'; 
echo "\n"; 
if (isset($array['FOO']))
{
   if (isset($array['FOO']['hello']))
   {
      echo 'array FOO.hello is set.'; 
   }
   else
   {
      echo 'array FOO.hello is not set.'; 
   }
   echo "\n"; 

   if (isset($array['FOO']['hello1']))
   {
      echo 'array FOO.hello1 is set.'; 
   }
   else
   {
      echo 'array FOO.hello1 is not set.'; 
   }
    
}
else
{
    echo 'array is not set.'; 
}

echo "\n"; 

$env_tce = false;
if (isset($array['env']['tce']))
{
   echo 'array env.tce is set.'; 
   $env_tce = $array['env']['tce'];
}
else
{
   echo 'array env.tce is not set.'; 
}

echo "\n"; 

if ($env_tce) 
{
   echo 'env.tce. is true'; 
}
else
{
   echo 'env.tce. is false '; 
}

?> 
