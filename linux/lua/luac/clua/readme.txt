http://www.troubleshooters.com/codecorn/lua/lua_c_calls_lua.htm


Troubleshooters.Com and Code Corner Present

Litt's Lua Laboratory:
Calling Lua From a C Program
(With Snippets)

Copyright (C) 2011 by Steve Litt


Debug like a Ninja
Contents

Introduction
Anatomy of a Lua Call
Hello World
Calling Subroutines, Sending Arguments and Receiving Returns
Passing Tables to Lua Functions
Introduction

From a running C program, you can call a Lua script. The C program can pass arguments to the Lua script, and the Lua script can pass back a return. The Lua script can serve to initialize the C program, or the Lua script can install a callback routine in the C program.

Calling a Lua script from a C program can be daunting without the right information. Different computers have different names and locations for libraries and include files, and it's difficult to figure out what's causing compile/link problems.

Further complicating things is that with every major version of Lua, the method of calling Lua from C changes. Much documentation on the Internet is specific to Lua 5.0, and won't work on 5.1. Likewise, this documentation is specific to 5.1, and when 5.2 comes out (it's alpha right now), the documentation on this page won't work on the new version.

The purpose of this document is to make it easy for you to do simple Lua calls from C programs.
Anatomy of a Lua Call

A typical interaction from a C program to a Lua 5.1 script looks something like this:
Create a Lua state variable
Load Lua libraries
Load but don't run the Lua script file
Priming script run to create script's global vars
Pass all arguments to the Lua script on the stack
Run the loaded Lua script
Retrieve the return from the Lua script
Close the Lua state variable

Create a Lua state variable	   
lua_State *L;
L = luaL_newstate();
Load Lua libraries	
luaL_openlibs(L);
Load but don't run the Lua script file	
luaL_loadfile(L, "script.lua")
Priming run of the loaded Lua script
to create the script's global variables

lua_pcall(
	L, 
	number_of_args, 
	number_of_returns, 
	errfunc_idx
	);
Pass all arguments to the Lua script on the stack	
Various routines, too many to name.
Run the loaded Lua script	
 lua_pcall(
	L, 
	number_of_args, 
	number_of_returns, 
	errfunc_idx
	);

Retrieve the return from the Lua script	
Various pops and stack calls
Close the Lua state variable	
lua_close(L);

Header Files

Always put these three header files at the top of any C program calling Lua:
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h> 
Compiling and Linking

Nothing is tougher than compiling and linking your first C to Lua program. There are way too many variables, it seems like everything's a black box, and you run around changing things trial and error, crossing your fingers.

But there's a method to the madness, and this subsection explains it. If you know all the content of this section, try not to be offended or insulted -- the extra info is for those who don't know it yet.

Here's a typical command to compile it:
cc -Wall -o hello hello.c -I/path/to/Lua/includes -L/path/to/Lua/libraries -llibLuaName -lm
Let's break that down:
cc
  
Your systems C compilation command. Could be cc, or gcc, or something else.
-Wall

Show all warnings. You might choose not to insert this until all other errors and warnings have been fixed.
-o hello

The name of the finished executable.
hello.c

The name of the C file to compile.
-I/path/to/Lua/includes

Every C compiler checks for include files in certain places. But often  lua.h, liblua.h and lauxlua.h aren't in those places, so you need to tell the compiler where to find them.
-L/path/to/Lua/libraries
      

Every C compiler checks for libraries to link in certain places. But often the Lua libraries are elsewhere, so you need to tell the compiler where to find them.
-llibLuaName
      

Link in the Lua library. The way you name this library in the compiler's -l option requires some thought and research, which will be explained later in this subsection.
-lm

Link in the math library (often not necessary)
The Process of Finding the Right Compile Command

Finding the right compile command is a process that looks something like this:
Try to compile, no link, no -Wall, no -I. You might get lucky.
Find the location of the Lua include files.
Using that location, compile, no link, no -Wall.
Compile, no link, use -Wall.
Find the location and filenames of the Lua library files.
Using the location and filenames, compile and link.
Test the Executable.
Step 1: Try to compile, no link, no -Wall, no -I

Do this:
cc -o hello hello.c  -c
Notice that the -c means "compile only, do not link". Sometimes it's not all that clear whether an error or warning comes from compile or link, but it's very clear if you only compile. If the preceding command doesn't error out, skip to step 4. However, in my case it errored out:
slitt@mydesk:~$ cc -o hello hello.c  -c
hello.c:8:91: error: lua.h: No such file or directory
hello.c:9:91: error: lauxlib.h: No such file or directory
hello.c:10:85: error: lualib.h: No such file or directory
hello.c:16: error: expected ‘)’ before ‘*’ token
hello.c: In function ‘main’:
hello.c:24: error: ‘lua_State’ undeclared (first use in this function)
hello.c:24: error: (Each undeclared identifier is reported only once
hello.c:24: error: for each function it appears in.)
hello.c:24: error: ‘L’ undeclared (first use in this function)
slitt@mydesk:~$
On to step 2...
Step 2: Find the location of the Lua include files

The three Ubiquitous Lua include files are lua.h, lauxlib.h, and lualib.h. Use your Linux box's locate command to find lua.h after running updatedb to make sure that locate finds everything. Make sure that the directory with lua.h also contains lauxlib.h, and lualib.h. 
slitt@mydesk:~$ sudo updatedb
[sudo] password for slitt: 
slitt@mydesk:~$ locate /lua.h
/usr/include/lua5.1/lua.h
/usr/include/lua5.1/lua.hpp
/usr/share/doc/lua5.1-doc/doc/lua.html
/usr/share/doc/lua5.1-doc/etc/lua.hpp
slitt@mydesk:~$
Obviously the directory you want is /usr/include/lua5.1. Now see if that directory contains the other two:
slitt@mydesk:~$ ls /usr/include/lua5.1/lualib.h
/usr/include/lua5.1/lualib.h
slitt@mydesk:~$ ls /usr/include/lua5.1/lauxlib.h
/usr/include/lua5.1/lauxlib.h
slitt@mydesk:~$
OK, that's it. You know you need to add -I /usr/include/lua5.1 to the command.
Step 3: Using that location, compile, no link, no -Wall

cc -o hello hello.c -I/usr/include/lua5.1 -c
In my case the preceding worked:
slitt@mydesk:~$ cc -o hello hello.c -I/usr/include/lua5.1 -c
slitt@mydesk:~$
If it hadn't worked, and you'd included all three header files in hello.c, and you're sure you got the additional include directory right, suspect wrong code in hello.c itself. If it doesn't produce errors or warnings, go on to the next step...
Step 4: Compile, no link, use -Wall

cc -o hello hello.c -Wall -I/usr/include/lua5.1 -c
In my case, the preceding produced no errors or warnings:
slitt@mydesk:~$ cc -o hello hello.c -Wall -I/usr/include/lua5.1 -c
slitt@mydesk:~$ 
If it produces warnings, try your best to fix them. Warnings are often a sign of problems that rear their ugly head a week after deployment.

Once you have no errors or warnings, go on to the next step...
Step 5: Find the location and filenames of the Lua library files

First a word about how the -l compiler option works. The -l option assumes every library file starts with "lib". Therefore, instead of making you type -lliblua, it makes you type -llua and then out of the goodness of its heart prepends lib before the lua. For instance, if you put -llua, that means that it searches for a file called liblua.a or liblua.o or liblua.so, etc. So you need to find the liblua.* files. Do it as follows:
sudo updatedb
locate liblua | less
Here's the partial result:
/usr/lib/liblua5.1-sql-postgres.a
/usr/lib/liblua5.1-sql-postgres.la
/usr/lib/liblua5.1-sql-postgres.so
/usr/lib/liblua5.1-sql-postgres.so.2
/usr/lib/liblua5.1-sql-postgres.so.2.0.0
/usr/lib/liblua5.1-sql-sqlite3.so.2
/usr/lib/liblua5.1-sql-sqlite3.so.2.0.0
/usr/lib/liblua5.1-unix.so.2
/usr/lib/liblua5.1-unix.so.2.0.0
/usr/lib/liblua5.1.a
/usr/lib/liblua5.1.la
/usr/lib/liblua5.1.so
/usr/lib/liblua5.1.so.0
/usr/lib/liblua5.1.so.0.0.0
/usr/lib/liblua50.so.5
/usr/lib/liblua50.so.5.0
/usr/lib/liblualib50.so.5
/usr/lib/liblualib50.so.5.0
/usr/lib/debug/usr/lib/liblua5.1.so.0.0.0
See the ones called liblua5.1.*? Those are the Lua libraries on my computer.  So we have a pretty good idea that the -l argument should be lua5.1. We also know that they're located in /usr/lib, which probably is already on the C compiler's library path, so we probably don't need a -L compiler option. If these files had been in /usr/lib/lua, we'd have needed an -L option.
Step 6: Using the location and filenames, compile and link

This step differs from step 4 in two ways:
We remove the -c so that it will attempt to link
We add -llua5.1
Here we go...
slitt@mydesk:~$ cc -o hello hello.c -Wall -I/usr/include/lua5.1 -llua5.1
slitt@mydesk:~$
It worked. If it hadn't, we'd have been forced to troubleshoot.

Step 7: Test the Executable

So let's run it:
slitt@mydesk:~$ ./hello
In C, calling Lua
This is coming from lua.
Back in C again
slitt@mydesk:~$
You haven't seen the code for hello.c and helloscript.lua yet, but take it from me that the preceding output was exactly what it was supposed to do.
Summary

Here's how you build a C program that runs a Lua script:
Create a Lua state variable	   
lua_State *L;
L = luaL_newstate();
Load Lua libraries	
luaL_openlibs(L);
Load but don't run the Lua script file	
luaL_loadfile(L, "script.lua")
Priming run of the loaded Lua script
to create the script's global variables

lua_pcall(
	L, 
	number_of_args, 
	number_of_returns, 
	errfunc_idx
	);
Pass all arguments to the Lua script on the stack	
Various routines, too many to name.
Run the loaded Lua script	
 lua_pcall(
	L, 
	number_of_args, 
	number_of_returns, 
	errfunc_idx
	);

Retrieve the return from the Lua script	
Various pops and stack calls
Close the Lua state variable	
lua_close(L);


You always include  lua.h, lauxlib.h and lualib.h. You use the Linux locate command to find where those files are, and use that location in a -I compiler option. You always link with liblua, and you use locate commands to find where that library is, and use it in the -l compiler option and if its location isn't in a normal library directory, put its directory in a -L compiler option.

Getting Lua-calling C programs to compile and link can be difficult and frustrating. To limit the difficulty and frustration, use this process:
Try to compile, no link, no -Wall, no -I. You might get lucky.
Find the location of the Lua include files.
Using that location, compile, no link, no -Wall.
Compile, no link, use -Wall.
Find the location and filenames of the Lua library files.
Using the location and filenames, compile and link.
Test the Executable.
Now it's time for your Hello World program.
Hello World

Let's start with the one line Lua script itself. Call it helloscript.lua:
io.write("This is coming from lua.\n")
That's it, one line. Notice it doesn't have the #!/usr/bin/lua line on top. It doesn't have to because the C Lua interface has a built-in Lua interpreter which the lua_pcall() function invokes automatically.

So if you run the C program and see the text "This is coming from lua." you know you've succeded.

Next let's review the steps covered in the Anatomy of a Lua Call article:
Create a Lua state variable	   
lua_State *L;
L = luaL_newstate();
Load Lua libraries	
luaL_openlibs(L);
Load but don't run the Lua script file	
luaL_loadfile(L, "script.lua")
Priming run of the loaded Lua script
to create the script's global variables

lua_pcall(
	L, 
	number_of_args, 
	number_of_returns, 
	errfunc_idx
	);
Pass all arguments to the Lua script on the stack	
Various routines, too many to name.
Run the loaded Lua script	
 lua_pcall(
	L, 
	number_of_args, 
	number_of_returns, 
	errfunc_idx
	);

Retrieve the return from the Lua script	
Various pops and stack calls
Close the Lua state variable	
lua_close(L);


Your Hello World program will implement all the above, in that same order, EXCEPT:

Priming run of the loaded Lua script
Passing arguments to the Lua script
Retrieving the return from the Lua script
Also, we'll put in an error handler function called bail() just to make the code look more concise. We'll call this program hello.c. Here's the code:
#include <lua.h>                                /* Always include this when calling Lua */
#include <lauxlib.h>                            /* Always include this when calling Lua */
#include <lualib.h>                             /* Always include this when calling Lua */

#include <stdlib.h>                             /* For function exit() */
#include <stdio.h>                              /* For input/output */

void bail(lua_State *L, char *msg){
	fprintf(stderr, "\nFATAL ERROR:\n  %s: %s\n\n",
		msg, lua_tostring(L, -1));
	exit(1);
}

int main(void)
{
    lua_State *L;

    L = luaL_newstate();                        /* Create Lua state variable */
    luaL_openlibs(L);                           /* Load Lua libraries */

    if (luaL_loadfile(L, "helloscript.lua"))    /* Load but don't run the Lua script */
	bail(L, "luaL_loadfile() failed");      /* Error out if file can't be read */

    printf("In C, calling Lua\n");

    if (lua_pcall(L, 0, 0, 0))                  /* Run the loaded Lua script */
	bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */

    printf("Back in C again\n");

    lua_close(L);                               /* Clean up, free the Lua state var */

    return 0;
}
As you can see, it's pretty much the same as discussed in the list of steps, except no args are passed into Lua and no return variables are passed out.

Remembering the discussion from the Anatomy of a Lua Call article, compile and link it, troubleshooting as necessary. Here's how it compiles and links on my computer:
slitt@mydesk:~$ cc -o hello hello.c -Wall -I/usr/include/lua5.1 -llua5.1
slitt@mydesk:~$
Do what's needed til it compiles no errors, no warnings, with the -Wall compiler option. Then run it. It should look like this:
slitt@mydesk:~$ ./hello
In C, calling Lua
This is coming from lua.
Back in C again
slitt@mydesk:~$
Study the program. Everything should be pretty obvious except lua_pcall(), and that will be discussed later. Once you've gotten output like the preceding and really understand what's going on (with the possible exception of lua_pcall() details), it's time to continue...
Calling Subroutines, Sending Arguments and Receiving Returns

Remember the program from the Hello World article did everything except these:
Priming run of the loaded Lua script
Passing arguments to the Lua script
Retrieving the return from the Lua script
In this article we'll do all these things. By the time you're done constructing the code in this article, you'll have passed arguments,  from Lua to a C subroutine, and have received back return values.

Tourist Trap Alert

All over the Internet, including on some of the Lua project's own documentation, you'll see hints basically telling you that to call a C subroutine you do:

lua_getglobals(L, "subroutine_name")
push_args_to_subroutine
if(lua_pcall(L, num_of_args, num_of_returns, 0)
   error_routine(); 

These Internet instructions say nothing about doing a priming lua_pcall(), and if you do not do a priming lua_pcall(), you'll get an error message something like this:

attempt to call a nil value

If you get the preceding error message and don't know it's caused by lack of a priming lua_pcall() (or priming lua_call() or priming dofile()), you're about to have several hours or maybe even days of frustration. Mailing list threads old and new about this error basically tell you RTFM or RTFW, but of course we locals know it was reading the web that got you into this problem in the first place. 

I saw one guy who took the opportunity to tell the asker "I'm trying to help you help yourself but you won't take the help, so now I'm putting you on my list of people I won't help." All for what we locals know was probably a simple lack of a priming run THAT SEEMS NOT TO BE DOCUMENTED ANYWHERE!

Before calling a function in a Lua script, do that priming run first!!!!!!

OK, let's start by calling a specific function in a Lua script. Create this callfuncscript.lua file:
function tellme()
	io.write("This is coming from lua.tellme.\n")
end
Now, noting that most of it is from the Hello World article you've already read, create the following callfunc.c:
#include <lua.h>                                /* Always include this when calling Lua */
#include <lauxlib.h>                            /* Always include this when calling Lua */
#include <lualib.h>                             /* Prototype for luaL_openlibs(), */
                                                /*   always include this when calling Lua */

#include <stdlib.h>                             /* For function exit() */
#include <stdio.h>                              /* For input/output */

void bail(lua_State *L, char *msg){
	fprintf(stderr, "\nFATAL ERROR:\n  %s: %s\n\n",
		msg, lua_tostring(L, -1));
	exit(1);
}

int main(void)
{
    lua_State *L;

    L = luaL_newstate();                        /* Create Lua state variable */
    luaL_openlibs(L);                           /* Load Lua libraries */

    if (luaL_loadfile(L, "callfuncscript.lua")) /* Load but don't run the Lua script */
	bail(L, "luaL_loadfile() failed");      /* Error out if file can't be read */

    /* ABOVE HERE IS HELLO WORLD CODE */

    if (lua_pcall(L, 0, 0, 0))                  /* PRIMING RUN. FORGET THIS AND YOU'RE TOAST */
	bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */


    lua_getglobal(L, "tellme");                 /* Tell what function to run */

    /* BELOW HERE IS THE HELLO WORLD CODE */
    printf("In C, calling Lua\n");
    if (lua_pcall(L, 0, 0, 0))                  /* Run the function */
	bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */
    printf("Back in C again\n");

    lua_close(L);                               /* Clean up, free the Lua state var */

    return 0;
}
The only change over the Hello World code is a priming run and pushing the tellme() Lua function via the lua_getglobal() call. Note that the second lua_pcall() still has its second arg, number_of_args, of 0, because you're not sending an argument to the Lua function tellme().
Arguments and Return Value

The previous part of this article was written primarily to make sure you knew that to call a specific Lua function, you need to push that function on the stack with lua_getglobal(), and that you make sure to do a priming run, because without it you're in for hours of frustrating debugging and detour ridden RTFW. 
Litt Opinion

There are several pieces of example code on the net showing the passing of arguments to entire Lua scripts rather than functions, and those whole Lua scripts returning arguments. They do this by, within C, setting a global variable to be used in Lua. I've chosen not to reproduce these techniques here because:
In my opinion the internals of such code is a little hard to understand
I never liked global variables in the first place.
Multiple args to the main Lua script require multiple global variables such code becomes quite muddled
Functions are built from the ground up to accept a series of arguments.

Now take your callfuncscript.lua file and add a function called square, so the whole script looks like this:
function tellme()
	io.write("This is coming from lua.tellme.\n")
end

function square(n)
	io.write("Within callfuncscript.lua fcn square, arg=")
	io.write(tostring(n))
	n = n * n
	io.write(", square=")
	io.write(tostring(n))
	print(".")
	return(n)
end

print("Priming run")
And change callfunc.c to look like the following:
#include <lua.h>                                /* Always include this when calling Lua */
#include <lauxlib.h>                            /* Always include this when calling Lua */
#include <lualib.h>                             /* Prototype for luaL_openlibs(), */
                                                /*   always include this when calling Lua */

#include <stdlib.h>                             /* For function exit() */
#include <stdio.h>                              /* For input/output */

void bail(lua_State *L, char *msg){
	fprintf(stderr, "\nFATAL ERROR:\n  %s: %s\n\n",
		msg, lua_tostring(L, -1));
	exit(1);
}

int main(void)
{
    lua_State *L;

    L = luaL_newstate();                        /* Create Lua state variable */
    luaL_openlibs(L);                           /* Load Lua libraries */

    if (luaL_loadfile(L, "callfuncscript.lua")) /* Load but don't run the Lua script */
        bail(L, "luaL_loadfile() failed");      /* Error out if file can't be read */

    if (lua_pcall(L, 0, 0, 0))                  /* PRIMING RUN. FORGET THIS AND YOU'RE TOAST */
        bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */

    printf("In C, calling Lua->tellme()\n");

    lua_getglobal(L, "tellme");                 /* Tell it to run callfuncscript.lua->tellme() */
    if (lua_pcall(L, 0, 0, 0))                  /* Run the function */
        bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */

    printf("Back in C again\n");
    printf("In C, calling Lua->square(6)\n");

    lua_getglobal(L, "square");                 /* Tell it to run callfuncscript.lua->square() */
    lua_pushnumber(L, 6);                       /* Submit 6 as the argument to square() */
    if (lua_pcall(L, 1, 1, 0))                  /* Run function, !!! NRETURN=1 !!! */
	bail(L, "lua_pcall() failed"); 

    printf("Back in C again\n");
    int mynumber = lua_tonumber(L, -1);
    printf("Returned number=%d\n", mynumber);

    lua_close(L);                               /* Clean up, free the Lua state var */
    return 0;
}
Be sure to notice the following things in the preceding C code:
Even though two functions are called, only one priming run is needed. Each Lua script requires only one priming run in order to create its globals so its functions are visible to the C program.
In order to fully pass an integer into callfuncscript.lua's square() function and receive the function's return, the lua_pcall()'s nargs argument must be 1 (one argument passed in) and its nreturns argument must be 1 (1 argument passed back). If nargs is 0 you'll get the dreaded " attempt to call a number value" error, while if nreturns is 0 it will always return 0. So remember, this lua_pcall() is lua_pcall(L, 1, 1, 0).

Passing Tables to Lua Functions

A use case that happens often is the passing of tables to and from Lua functions. How is that handled? There are a few idioms you see over and over again to make it happen. Before discussing the idioms, here's the code:
The Lua Program

Here's the Lua program. As you can see, function tweaktable receives a table argument, converts all values to upper case, counts the values, and puts all that info in a new table that's returned.
function tellme()
	io.write("This is coming from lua.tellme.\n")
end

function square(n)
	io.write("Within callfuncscript.lua fcn square, arg=")
	io.write(tostring(n))
	n = n * n
	io.write(", square=")
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
The C Program

The C program is the same as all the others except stacking arguments to Lua is a little different, and recovering the table passed back from Lua is a little different. The Lua tweaktable() function takes a table as its one and only argument and passes back one table. It passes back a completely different table so there's absolutely no question of the changes being made by reference to the args rather than passback.

Start by looking and running the code, and then we'll discuss some of the idioms that make it work...
#include <lua.h>                                /* Always include this when calling Lua */
#include <lauxlib.h>                            /* Always include this when calling Lua */
#include <lualib.h>                             /* Prototype for luaL_openlibs(), */
                                                /*   always include this when calling Lua */

#include <stdlib.h>                             /* For function exit() */
#include <stdio.h>                              /* For input/output */

void bail(lua_State *L, char *msg){
	fprintf(stderr, "\nFATAL ERROR:\n  %s: %s\n\n",
		msg, lua_tostring(L, -1));
	exit(1);
}

int main(void)
{
    lua_State *L;

    L = luaL_newstate();                        /* Create Lua state variable */
    luaL_openlibs(L);                           /* Load Lua libraries */

    if (luaL_loadfile(L, "callfuncscript.lua")) /* Load but don't run the Lua script */
        bail(L, "luaL_loadfile() failed");      /* Error out if file can't be read */

    if (lua_pcall(L, 0, 0, 0))                  /* PRIMING RUN. FORGET THIS AND YOU'RE TOAST */
        bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */

    printf("In C, calling Lua->tweaktable()\n");
    lua_getglobal(L, "tweaktable");             /* Tell it to run callfuncscript.lua->tweaktable() */
    lua_newtable(L);                            /* Push empty table onto stack table now at -1 */
    lua_pushliteral(L, "fname");                /* Push a key onto the stack, table now at -2 */
    lua_pushliteral(L, "Margie");               /* Push a value onto the stack, table now at -3 */
    lua_settable(L, -3);                        /* Take key and value, put into table at -3, */
                                                /*  then pop key and value so table again at -1 */

    lua_pushliteral(L, "lname");                /* Push a key onto the stack, table now at -2 */    
    lua_pushliteral(L, "Martinez");             /* Push a value onto the stack, table now at -3 */
    lua_settable(L, -3);                        /* Take key and value, put into table at -3, */
                                                /*  then pop key and value so table again at -1 */

    if (lua_pcall(L, 1, 1, 0))                  /* Run function, !!! NRETURN=1 !!! */
	bail(L, "lua_pcall() failed"); 

    printf("============ Back in C again, Iterating thru returned table ============\n");

  /* table is in the stack at index 't' */
    lua_pushnil(L);  /* Make sure lua_next starts at beginning */
    const char *k, *v;
    while (lua_next(L, -2)) {                    /* TABLE LOCATED AT -2 IN STACK */
        v = lua_tostring(L, -1);                 /* Value at stacktop */
        lua_pop(L,1);                            /* Remove value */
        k = lua_tostring(L, -1);                 /* Read key at stacktop, */
                                                 /* leave in place to guide next lua_next() */
        printf("Fromc k=>%s<, v=>%s<\n", k, v);
    }

    lua_close(L);                               /* Clean up, free the Lua state var */
    return 0;
}
The preceding code yields the following output:
slitt@mydesk:~$ ./callfunc
Priming run
In C, calling Lua->tweaktable()
At bottom of callfuncscript.lua tweaktable(), numfields=3
============ Back in C again, Iterating thru returned table ============
Fromc k=>fname<, v=>MARGIE<
Fromc k=>lname<, v=>MARTINEZ<
Fromc k=>numfields<, v=>3<
slitt@mydesk:~$
Table Argument Passing Idioms

You start by placing an empty table on the stack, and build it it one key/value pair at a time. The way you place an empty table on the stack is with the following command:
lua_newtable(L);
The way you give the now stacked table a key/value pair is like this:
                                /* Table at stack top, index -1 right now. */
lua_pushliteral(L, "fname");    /* Push a key onto the stack, table ends up at -2 */
lua_pushliteral(L, "Margie");   /* Push a value onto the stack, table ends up at -3 */
lua_settable(L, -3);            /* Incorporate key and value, into the table */
                                /*  then pop twice so table again at -1 */
                                /* repeat as necessary */
You can do that over and over again with different key/value pairs. Each time the numeric argument to lua_settable() is -3 because lua_settable pops the two stack items above it after incorporating them in its table, so at its end it's at the same level that it was before you stacked the key and value.

Note that you might be stacking things other than literals. Here are the many pushers available:

lua_pushboolean
lua_pushcclosure
lua_pushcfunction
lua_pushfstring
lua_pushinteger
lua_pushlightuserdata
lua_pushliteral
lua_pushlstring
lua_pushnil
lua_pushnumber
lua_pushstring
lua_pushthread
lua_pushvalue
lua_pushvfstring

Other functions push or at least put things on the stack, including:

lua_getglobal(L, fcnname)
In spite of what it sounds like, this function actually puts  the function corresponding to the fcnname argument on the top of the stack.
lua_newtable(L)
This function puts an empty table at the top of the stack.
lua_next(L, -level)
This function replaces the previous key with the new one, and then pushes the new value on top of that. You need to do a pop to stay even.

And here are some poppers:
lua_pop(L,number)
This pops off the stack, number levels.
lua_settable(L, -level)
This pops twice after assigning the key/value pair in the top two stack positions to the table at level -level.

Table Return Passing Idioms

When a Lua function called from C returns ends it puts its return values on the stack. When a return value is a table, retrieving the table's elements isn't obvious. Assuming the Lua function returned only one thing and that thing is a table, then that table is at the stack's top when it comes back to C. Here's how you access it:
lua_pushnil(L);  /* Make sure lua_next starts at beginning */
const char *k, *v;
while (lua_next(L, -2)) {                    /* TABLE LOCATED AT -2 IN STACK */
   v = lua_tostring(L, -1);                 /* Value at stacktop */
   lua_pop(L,1);                            /* Remove value */
   k = lua_tostring(L, -1);                 /* Read key at stacktop, */
                                            /* leave in place to guide next lua_next() */
   /* Do what you need to with k and v */
}
In the preceding, you push a nil in order to make sure lua_next() starts with the first item. The reason you use -2 as an arg to lua_next() is because after you push the nil, the returned table is the second item down on the stack. On each iteration, lua_next() replaces the existing key with the next one, and then pushes the next value on top of it. Therefore to keep things in place you need one pop per cycle.

On every iteration immediately after lua_next(), the top of the stack is the new value, one down from that is the new key, and one down from that is the table.






 [ Troubleshooters.com   |   Code Corner   |   Email Steve Litt ]

   Copyright (C) 2011 by Steve Litt   --   Legal




