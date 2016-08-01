#!/usr/bin/env lua
require("mylib")
t_dir=mydir("/")
for k, v in pairs(t_dir) 
do
	print(v)
end
--(".")
