set term wxt enhanced
set xtics ("{/Symbol p}" pi, "{/Symbol p}/2" pi/2,\
    "2{/Symbol p}" 2*pi, "3{/Symbol p}/2" 3*pi/2, "0" 0)
plot [0:2*pi] sin(x)
