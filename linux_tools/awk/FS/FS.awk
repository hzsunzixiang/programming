#! /usr/bin/awk -f
BEGIN{
	print FS>"FS"; 
	system("wc -c FS")
	FS=" \t\n";
#	system("sleep 1")
	print FS>"FS_self"; 
	system("wc -c FS_self")
}

