function tellme()
	io.write("This is coming from lua.tellme.\n")
end

io.write("This is coming from lua.\n")


function square(n)
	io.write("Within callfuncscript.lua fcn square, arg=")
	io.write(tostring(n))
	n = n * n
	io.write(", square=")
	io.write(tostring(n))
	print(".")
	return(n)
end

function add(m, n)
	io.write("Within callfuncscript.lua fcn add, arg=")
	io.write(tostring(m))
	io.write("	")
	io.write(tostring(n))
	n = m + n
	io.write(", add=")
	io.write(tostring(n))
	print(".")
	return(n)
end

function tweaktable(tab_in)
	local tab_out = {numfields=1}
	for k,v in pairs(tab_in) do
		tab_out.numfields = tab_out.numfields + 1
		tab_out[tostring(k)] = string.upper(tostring(v))
	end
	tab_out.numfields = tostring(tab_out.numfields)
	io.write("At bottom of callfuncscript.lua tweaktable(), numfields=")
	io.write(tab_out.numfields)
	print()
	return tab_out
end
print("Priming run")
