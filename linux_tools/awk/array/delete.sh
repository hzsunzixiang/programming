#! /bin/sh
awk '
BEGIN{
	foo[1]="hello";
	foo[2]="world";
	for(var in foo)
		print foo[var];
	delete foo[1];

	print "\nafter delete\n"
	for(var in foo)
		print foo[var];
}' 
