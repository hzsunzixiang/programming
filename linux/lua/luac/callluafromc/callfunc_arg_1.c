#include <lua.h>                                /* Always include this when calling Lua */
#include <lauxlib.h>                            /* Always include this when calling Lua */
#include <lualib.h>                             /* Prototype for luaL_openlibs(), */
                                                /*   always include this when calling Lua */

#include <stdlib.h>                             /* For function exit() */
#include <stdio.h>                              /* For input/output */

// gdb this program
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

	// 这个是必须的，不然报错
	//    Even though two functions are called, only one priming run is needed. Each Lua script requires only one priming run in order to create its globals so its functions are visible to the C program.
    if (lua_pcall(L, 0, 0, 0))                  /* PRIMING RUN. FORGET THIS AND YOU'RE TOAST */
        bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */

    printf("In C, calling Lua->tellme()\n");

    lua_getglobal(L, "tellme");                 /* Tell it to run callfuncscript.lua->tellme() */
    if (lua_pcall(L, 0, 0, 0))                  /* Run the function */
        bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */

    printf("Back in C again\n");
    printf("In C, calling Lua->square(6)\n");

    lua_getglobal(L, "square");                 /* Tell it to run callfuncscript.lua->square() */

	// void lua_pushnumber (lua_State *L, lua_Number n);
	// Pushes a number with value n onto the stack.
	// 这里在lua端会有入栈操作  #define api_incr_top(L)   {api_check(L, L->top < L->ci->top); L->top++;}
	// 先修改栈顶 数据 setnvalue(L->top, n);
	// https://ttuxen.wordpress.com/tag/lua-stack/

	lua_pushnumber(L, 6);                       /* Submit 6 as the argument to square() */
	// c.func = L->top - (nargs+1);  /* function to be called */
	// lua_pcall 会根据nargs 参数判断函数和参数的位置
	// nargs 传的不正确 回导致错误
	if (lua_pcall(L, 1, 1, 0))                  /* Run function, !!! NRETURN=1 !!! */
		bail(L, "lua_pcall() failed"); 

	// 下面这个, 栈顶其实是 数字6   指示参数为0， 会把数字6当函数使用，显然不正确
	//	if (lua_pcall(L, 0, 1, 0))                  /* Run function, !!! NRETURN=1 !!! */
	// 	FATAL ERROR:
	// 		  lua_pcall() failed: attempt to call a number value


	// 下面这个, 栈顶其实是 数字6, 然后是函数， 在后面为nil值  显然不正确
	//	if (lua_pcall(L, 2, 1, 0))                  /* Run function, !!! NRETURN=1 !!! */
	//  FATAL ERROR:
	//		  lua_pcall() failed: attempt to call a nil value


	printf("Back in C again\n");
	// -1 取栈顶数据
	// lua_pcall的第三个参数
	int mynumber = lua_tonumber(L, -1);
	printf("Returned number=%d\n", mynumber);

    printf("Back in C again\n");
    printf("In C, calling Lua->add(10, 6)\n");

    lua_getglobal(L, "add");                 /* Tell it to run callfuncscript.lua->() */
	lua_pushnumber(L, 10);                       /* Submit 10 as the first argument to add() */
	lua_pushnumber(L, 6);                       /* Submit 6 as the second argument to add() */
	// 栈结构如下
	//	| 6  |
	//	| 10 |
	//	| add|
	if (lua_pcall(L, 2, 1, 0))                  /* Run function, !!! NRETURN=1 !!! */
		bail(L, "lua_pcall() failed"); 

	printf("Back in C again\n");
	mynumber = lua_tonumber(L, -1);
	printf("Returned number=%d\n", mynumber);
	return 0;

	lua_close(L);                               /* Clean up, free the Lua state var */
	return 0;
}

//    Even though two functions are called, only one priming run is needed. Each Lua script requires only one priming run in order to create its globals so its functions are visible to the C program.
//	    In order to fully pass an integer into callfuncscript.lua's square() function and receive the function's return, the lua_pcall()'s nargs argument must be 1 (one argument passed in) and its nreturns argument must be 1 (1 argument passed back). If nargs is 0 you'll get the dreaded " attempt to call a number value" error, while if nreturns is 0 it will always return 0. So remember, this lua_pcall() is lua_pcall(L, 1, 1, 0).













