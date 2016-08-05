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

	// All over the Internet, including on some of the Lua project's own documentation, you'll see hints basically telling you that to call a C subroutine you do:
	// 
	// lua_getglobals(L, "subroutine_name")
	// push_args_to_subroutine
	// if(lua_pcall(L, num_of_args, num_of_returns, 0)
	//    error_routine();
	// 
	// These Internet instructions say nothing about doing a priming lua_pcall(), and if you do not do a priming lua_pcall(), you'll get an error message something like this:
	// 
	// attempt to call a nil value
	// 
	// If you get the preceding error message and don't know it's caused by lack of a priming lua_pcall() (or priming lua_call() or priming dofile()), you're about to have several hours or maybe even days of frustration. Mailing list threads old and new about this error basically tell you RTFM or RTFW, but of course we locals know it was reading the web that got you into this problem in the first place.
	// 
	// I saw one guy who took the opportunity to tell the asker "I'm trying to help you help yourself but you won't take the help, so now I'm putting you on my list of people I won't help." All for what we locals know was probably a simple lack of a priming run THAT SEEMS NOT TO BE DOCUMENTED ANYWHERE!
	// 
	// Before calling a function in a Lua script, do that priming run first!!!!!!
	// 这个是必须的，不然报错
	// 在这里会运行所有非函数的lua语句
	// FATAL ERROR:
	// lua_pcall() failed: attempt to call a nil value

	if (lua_pcall(L, 0, 0, 0))                  /* PRIMING RUN. FORGET THIS AND YOU'RE TOAST */
	{
		bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */
		printf("error.......\n");
	}
	else
	{
		printf("success.......\n");
	}


	// void lua_getglobal (lua_State *L, const char *name);
	// Pushes onto the stack the value of the global name. It is defined as a macro:

    // #define lua_getglobal(L,s)  lua_getfield(L, LUA_GLOBALSINDEX, s)
	printf("-------------------\n");
	// 此时 把tellme 函数放入栈上 ,调用lua_pcall 执行这个函数
	//  push that function on the stack with lua_getglobal(),
	lua_getglobal(L, "tellme");                 /* Tell what function to run */

	/* BELOW HERE IS THE HELLO WORLD CODE */
	printf("In C, calling Lua\n");

	// The only change over the Hello World code is a priming run and pushing the tellme() Lua function via the lua_getglobal() call. Note that the second lua_pcall() still has its second arg, number_of_args, of 0, because you're not sending an argument to the Lua function tellme().
	if (lua_pcall(L, 0, 0, 0))                  /* Run the function */
		bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */
	printf("Back in C again\n");

	lua_close(L);                               /* Clean up, free the Lua state var */

	return 0;
}
