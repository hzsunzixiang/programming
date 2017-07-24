
# 不加这一行也可以?
libtoolize --force --automake
autoreconf  -i 
automake -a 
./configure 
