#! /usr/bin/awk -f
BEGIN{
	x=35;
	y=45;
	test_variable(x);
	printf("Return to main: arg1=%d,x=%d,y=%d,z=%d\n",arg1,x,y,z);
}
function test_variable(arg1)
{
    arg1++;#arg1是参数列上的参数，是local variable，离开此函数后将消失
    y++;#改变主程序中的变量y
    z=55;#z为该函数中新使用的变量，主程序中的变量z 仍可被使用
    printf("Inside the function: arg1=%d,x=%d,y=%d,z=%d\n",arg1,x,y,z);
}

