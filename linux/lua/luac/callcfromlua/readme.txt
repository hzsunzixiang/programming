http://www.troubleshooters.com/codecorn/lua/lua_lua_calls_c.htm

Troubleshooters.Com and Code Corner Present
Litt's Lua Laboratory:
Calling a C Function From Lua
(With Snippets)

Copyright (C) 2011 by Steve Litt

Debug like a Ninja
Contents

    Introduction
    Anatomy of a Lua to C Call
    Putting It All Together
    Make an msleep() Function
    We've Just Scratched the Surface

Introduction
Earlier you read the Calling Lua From a C Program  web page showing how to call Lua from C. There are a lot of instructions with no examples, always leaving something out, so you have to keep trying various things by trial and error, and there are just too many variables involved in calling C from Lua to do the trial and error thing.

This page shows you how to go the other way. Once again, there's a lot of misinformation and wrong-way-turns about this subject out on the Internet, so I'm going to show you, in the simplest possible way, how to do it.

If you haven't yet, please read and understand the Calling Lua From a C Program web page, because it has a lot of information I don't want to repeat here.
Anatomy of a Lua to C Call
From Lua's perspective, this is nothing more than a call to a module. A simple Lua program, calling functions in a C module called "power" containing functions "square" and "cube", would look something like this:

#!/usr/bin/lua
require("power")
print(square(1.414213598))
print(cube(5))

Clearly the complexity is all on the C side, because the Lua side is simple. The preceding code has a require("power") statement to load a module called "power", and obviously that module has functions square() and cube(). So the C program not only has to define functions square() and cube(), but must register itself as a module and register those two functions so that they're visible to Lua.

In the preceding Lua code, the require("power") statement does two very different things:

    Looks for something called power.so.
    Upon finding power.so, it looks for a function within power.so, called luaopen_power() to run. How did Lua magically come up with that particular function name? Simple -- the argument to the Lua require() statement is "power", so it looks for a function with that string appended to "luaopen_".

This gives you your first hint as to what goes in the C program. The C program must have a function whose name consists of "luaopen_" prepended to the argument to require(). So this means that the name of this function must match the name of the .so file (without the .so).

In fact, here's what this function might look like:

int luaopen_power(lua_State *L){
	lua_register(
			L,               /* Lua state variable */
			"square",        /* func name as known in Lua */
			isquare          /* func name in this file */
			);  
	lua_register(L,"cube",icube);
	return 0;
}

Its only argument is a Lua state variable, and for each C function it wants made available to Lua it must call lua_register(). The lua_register() function takes three arguments:

    The Lua state variable
    The name of the function as seen from Lua, expressed as a string
    A pointer to the function in the C program

So regardless of a function's name within the C file, it can be known by a different name from Lua. I'm not quite sure what the benefit of this is, but in these examples I actually used different names so you'd know what went with what.

So the first thing the require("power") statement does is load the power.so file and run the luaopen_power() function to register the functions in the C file. Now let's take a look at one of those functions:

static int isquare(lua_State *L){              /* Internal name of func */
	float rtrn = lua_tonumber(L, -1);      /* Get the single number arg */
	printf("Top of square(), nbr=%f\n",rtrn);
	lua_pushnumber(L,rtrn*rtrn);           /* Push the return */
	return 1;                              /* One return value */
}

A function runnable in Lua always has the same prototype -- a Lua state variable argument, and it returns a static int. That return value is the number of items it's returning.

Notice that the preceding code grabs the argument, passed from Lua, off the stack with lua_tonumber(L,-1). Then it returns the square of that number via lua_pushnumber(L,rtrn*rtrn). And last but not least, it tells the Lua caller it's passing back one value by returning 1.

The other tricky thing is compiling it. Here's what it looks like:

slitt@mydesk:~$ gcc -Wall -shared -fPIC -o power.so  -I/usr/include/lua5.1 -llua5.1   hellofunc.c
slitt@mydesk:~$

Here's what the preceding means:
ARG
	
	MEANING
gcc
	
	The compiler
-Wall
	
	Warn on almost anything
-shared
	
	Compile to .so format, and don't error out just because there's no main()
-fPIC
	
	Goes with -shared to tell the executable format. Subtle errors can sometimes creep in if you don't do this.
-o power.so
	
	Name the shared library power.so
-I/usr/include/lua5.1
	
	Look for lua.h etc in /usr/include/lua5.1. Note this will be different on every system.
-llua5.1
	
	Compile with the Lua library. Note this will be different on every system. See here for how you deduce the -l argument.
hellofunc.c
	
	The source file to the power library. It doesn't have to be named "power".

Now let's take a look at the whole program...
Putting It All Together
Here's the C code, in a file called hellofunc.c, implementing the power.so library:

/* hellofunc.c (C) 2011 by Steve Litt
 * gcc -Wall -shared -fPIC -o power.so -I/usr/include/lua5.1 -llua5.1 hellofunc.c
 * Note the word "power" matches the string after the underscore in
 * function luaopen_power(). This is a must.
 * The -shared arg lets it compile to .so format.
 * The -fPIC is for certain situations and harmless in others.
 * On your computer, the -I and -l args will probably be different.
*/

#include <lua.h>                               /* Always include this */
#include <lauxlib.h>                           /* Always include this */
#include <lualib.h>                            /* Always include this */

static int isquare(lua_State *L){              /* Internal name of func */
	float rtrn = lua_tonumber(L, -1);      /* Get the single number arg */
	printf("Top of square(), nbr=%f\n",rtrn);
	lua_pushnumber(L,rtrn*rtrn);           /* Push the return */
	return 1;                              /* One return value */
}
static int icube(lua_State *L){                /* Internal name of func */
	float rtrn = lua_tonumber(L, -1);      /* Get the single number arg */
	printf("Top of cube(), number=%f\n",rtrn);
	lua_pushnumber(L,rtrn*rtrn*rtrn);      /* Push the return */
	return 1;                              /* One return value */
}


/* Register this file's functions with the
 * luaopen_libraryname() function, where libraryname
 * is the name of the compiled .so output. In other words
 * it's the filename (but not extension) after the -o
 * in the cc command.
 *
 * So for instance, if your cc command has -o power.so then
 * this function would be called luaopen_power().
 *
 * This function should contain lua_register() commands for
 * each function you want available from Lua.
 *
*/
int luaopen_power(lua_State *L){
	lua_register(
			L,               /* Lua state variable */
			"square",        /* func name as known in Lua */
			isquare          /* func name in this file */
			);  
	lua_register(L,"cube",icube);
	return 0;
}

Compile the preceding with the following command:

gcc -Wall -shared -fPIC -o power.so -I/usr/include/lua5.1 -llua5.1 hellofunc.c

Now refer to it with hellofunc.lua:

#!/usr/bin/lua
require("power")
print(square(1.414213598))
print(cube(5))

And then run hellofunc.lua:

slitt@mydesk:~$ ./hellofunc.lua
Top of square(), nbr=1.414214
2.0000002687177
Top of cube(), number=5.000000
125
slitt@mydesk:~$

Bang! It worked!

Work with the code in this article until you get everything working. You might need to use some trial and error, but I think you'll get it.
Make an msleep() Function
If you've worked with Lua for awhile you've noticed that it has no sleep() function and certainly doesn't have anything that would delay for less than 1 second. One solution is to call C's sleep() and usleep() functions. Personally I think that it's silly to have millionths of a second grains of sleep, so I suggest making an msleep() whose argument is thousandths of a second. Since we're making an msleep() and Lua doesn't have a sleep(), we might as well take care of that in the same C file. Here we go:

/* 
 * gcc -shared -fPIC -o msleep.so -I/usr/include/lua5.1 -llua5.1 msleep.c
 * -I and -l may vary on your computer.
 * Your computer may use something besides -fPIC
*/

#include <unistd.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

static int msleep_c(lua_State *L){
	long msecs = lua_tointeger(L, -1);
	usleep(1000*msecs);
	return 0;                  /* No items returned */
}

/* Can't name this sleep(), it conflicts with sleep() in unistd.h */
static int sleep_c(lua_State *L){
	long secs = lua_tointeger(L, -1);
	sleep(secs);
	return 0;                  /* No items returned */
}

/* Register both functions */
int luaopen_msleep(lua_State *L){
	lua_register( L, "msleep", msleep_c);  
	lua_register(L, "sleep", sleep_c);
	return 0;
}

Compile it like this:

gcc -Wall -shared -fPIC -o msleep.so -I/usr/include/lua5.1 -llua5.1 msleep.c

Remember, on your system -I and -l may be different, and possibly your -f might be different.

Last but not least, use the following test_msleep.lua to test:

#!/usr/bin/lua
require("msleep")
p = print
sf = string.format

local start = os.time()
p(sf("Started at %d", start))
sleep(1)
local mid = os.time()
p(sf("After sleep(1), time is %d", mid))
msleep(2000)
local endd = os.time()
p(sf("After msleep(2000), time is %d", endd))
print()
p(sf("First  interval = %d seconds.", mid - start))
p(sf("Second interval = %d seconds.", endd - mid))
p(sf("Whole  interval = %d seconds.", endd - start))

The preceding code prints out the following, proving that the new functions work:

slitt@mydesk:~$ ./test_msleep.lua 
Started at 1297165088
After sleep(1), time is 1297165089
After msleep(2000), time is 1297165091

First  interval = 1 seconds.
Second interval = 2 seconds.
Whole  interval = 3 seconds.
slitt@mydesk:~$

This is just one small example of the beauty of including C functions in your Lua programs.
We've Just Scratched the Surface
This page showed a couple demonstration C functions and a couple very simple practical C functions that could be accessed via Lua. It showed nothing involving passing tables in as arguments to the C function nor back out as a function return. That doesn't mean it can't be done, although you need to watch the size of the stack when you do it.

The way I figure it, if you can see how to get ultra-simple C functions running in Lua, you can use RTFM and Rapid Learning to do the more complicated stuff.

 [ Troubleshooters.com| Code Corner | Email Steve Litt ]

Copyright (C) 2011 by Steve Litt --Legal




