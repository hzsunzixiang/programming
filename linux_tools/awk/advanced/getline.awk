#! /usr/bin/awk -f
BEGIN{
	"cat kecheng.dat"|getline var;
	close("kecheng.dat");
	print var;
}
BEGIN{
	"cat kecheng.dat"|getline;
	close("kecheng.dat");
	print $0;
}
BEGIN{
	getline var<"kecheng.dat";
	close("kecheng.dat")
	print var;
}
BEGIN{
	getline <"kecheng.dat";
	print $0;
}

