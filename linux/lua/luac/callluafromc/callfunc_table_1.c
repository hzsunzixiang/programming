#include <lua.h>                                /* Always include this when calling Lua */
#include <lauxlib.h>                            /* Always include this when calling Lua */
#include <lualib.h>                             /* Prototype for luaL_openlibs(), */
/*   always include this when calling Lua */
// http://www.troubleshooters.com/codecorn/lua/lua_c_calls_lua.htm

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

	// 这行非常重要 必须先调用
	if (lua_pcall(L, 0, 0, 0))                  /* PRIMING RUN. FORGET THIS AND YOU'RE TOAST */
		bail(L, "lua_pcall() failed");          /* Error out if Lua file has an error */

	printf("In C, calling Lua->tweaktable()\n");
	// lua_getglobal(L, fcnname)
	// 	In spite of what it sounds like, this function actually puts  the function corresponding to the fcnname argument on the top of the stack.
	lua_getglobal(L, "tweaktable");             /* Tell it to run callfuncscript.lua->tweaktable() */
	// stack now contains: -1  => tweaktable  

	// void lua_newtable (lua_State *L);
	// Creates a new empty table and pushes it onto the stack. It is equivalent to lua_createtable(L, 0, 0).
	// 创建一个table 压入栈中 table的引用在栈底 , 此时为-1
	// lua_newtable(L)
	// 	This function puts an empty table at the top of the stack.

	lua_newtable(L);                            /* Push empty table onto stack table now at -1 */
	// stack now contains: -1 => table; -2 => tweaktable  

	// void lua_pushliteral (lua_State *L, const char *s);
	// This macro is equivalent to lua_pushlstring, but can be used only when s is a literal string. In these cases, it automatically provides the string length.
	lua_pushliteral(L, "fname");                /* Push a key onto the stack, table now at -2 */
	// stack now contains: -1 => fname; -2 => table; -3 => tweaktable  
	lua_pushliteral(L, "Margie");               /* Push a value onto the stack, table now at -3 */
	// stack now contains: -1 => Margie ; -2 => fname; -3 => table; -4 => tweaktable  

	// 	void lua_settable (lua_State *L, int index);
	//	Does the equivalent to t[k] = v, where t is the value at the given valid index, v is the value at the top of the stack, and k is the value just below the top.
	//		This function pops both the key and the value from the stack. As in Lua, this function may trigger a metamethod for the "newindex" event (see §2.8).
	lua_settable(L, -3);                        /* Take key and value, put into table at -3, */
												/*  then pop key and value so table again at -1 */
	// lua_settable(L, -level)
	// 	This pops twice after assigning the key/value pair in the top two stack positions to the table at level -level.

	// stack now contains: -1 => table; -2 => tweaktable  

	// You can do that over and over again with different key/value pairs. Each time the numeric argument to lua_settable() is -3 because lua_settable pops the two stack items above it after incorporating them in its table, so at its end it's at the same level that it was before you stacked the key and value.

	// Does the equivalent to t[k] = v, 
	// where t is the value at the given valid index, 
	// v is the value at the top of the stack, and k is the value just below the top.
	// This function pops both the key and the value from the stack.

	// lua的实现中调用如下两句， lapi.c
	// 栈顶的两个元素 构成table 然后栈顶 -2
	// luaV_settable(L, t, L->top - 2, L->top - 1);
	// L->top -= 2;  /* pop index and value */

	lua_pushliteral(L, "lname");                /* Push a key onto the stack, table now at -2 */    
	// stack now contains: -1 => lname; -2 => table; -3 => tweaktable  
	lua_pushliteral(L, "Martinez");             /* Push a value onto the stack, table now at -3 */
	// stack now contains: -1 => Martinez; -2 => lname; -3 => table; -4 => tweaktable  
	lua_settable(L, -3);                        /* Take key and value, put into table at -3, */
												/*  then pop key and value so table again at -1 */


	// stack now contains: -1 => table; -2 => tweaktable  
	if (lua_pcall(L, 1, 1, 0))                  /* Run function, !!! NRETURN=1 !!! */
		bail(L, "lua_pcall() failed"); 

	printf("============ Back in C again, Iterating thru returned table ============\n");
	// int lua_next (lua_State *L, int index);
	// Pops a key from the stack, and pushes a key-value pair from the table at the given index (the "next" pair after the given key). If there are no more elements in the table, then lua_next returns 0 (and pushes nothing).
	// 
	// A typical traversal looks like this:
	// 
	//      /* table is in the stack at index 't' */
	//      lua_pushnil(L);  /* first key */
	//      while (lua_next(L, t) != 0) {
	//        /* uses 'key' (at index -2) and 'value' (at index -1) */
	//        printf("%s - %s\n",
	//               lua_typename(L, lua_type(L, -2)),
	//               lua_typename(L, lua_type(L, -1)));
	//        /* removes 'value'; keeps 'key' for next iteration */
	//        lua_pop(L, 1);
	//      }
	// While traversing a table, do not call lua_tolstring directly on a key, unless you know that the key is actually a string. Recall that lua_tolstring changes the value at the given index; this confuses the next call to lua_next.
	
	// 结合lua_next.c 可以看出，遍历的方式不止一种
	// 无非就是正确的操作栈
	/* table is in the stack at index 't' */
	// void lua_pushnil (lua_State *L);
	// Pushes a nil value onto the stack.
	lua_pushnil(L);  /* Make sure lua_next starts at beginning */
	// stack now contains: -1 => nil; -2 => table

	const char *k, *v;
	// lua_next(L, -level) This function replaces the previous key with the new one, and then pushes the new value on top of that. You need to do a pop to stay even.
	while (lua_next(L, -2)) {                    /* TABLE LOCATED AT -2 IN STACK */
		// stack now contains: -1 => value; -2 => key; -3 => table
		v = lua_tostring(L, -1);                 /* Value at stacktop */
		lua_pop(L,1);                            /* Remove value */
		// stack now contains: -1 => key; -2 => table
		k = lua_tostring(L, -1);                 /* Read key at stacktop, */
		/* leave in place to guide next lua_next() */
		printf("--- Fromc k=>%s<, v=>%s<\n", k, v);
		// stack now also: -1 => key; -2 => table
		// 这样下次循环的时候table仍然在-2的位置
	}

    // const char *lua_tostring (lua_State *L, int index);
	// Equivalent to lua_tolstring with len equal to NULL.

	// lua_tolstring
	// const char *lua_tolstring (lua_State *L, int index, size_t *len);
	// Converts the Lua value at the given acceptable index to a C string. If len is not NULL, it also sets *len with the string length. The Lua value must be a string or a number; otherwise, the function returns NULL. If the value is a number, then lua_tolstring also changes the actual value in the stack to a string. (This change confuses lua_next when lua_tolstring is applied to keys during a table traversal.)
	// 
	// lua_tolstring returns a fully aligned pointer to a string inside the Lua state. This string always has a zero ('\0') after its last character (as in C), but can contain other zeros in its body. Because Lua has garbage collection, there is no guarantee that the pointer returned by lua_tolstring will be valid after the corresponding value is removed from the stack.
	// 
	lua_close(L);                               /* Clean up, free the Lua state var */
	return 0;
}






// Other functions push or at least put things on the stack, including:
// 
// lua_getglobal(L, fcnname)
// 
// 	In spite of what it sounds like, this function actually puts  the function corresponding to the fcnname argument on the top of the stack.
// 
// lua_newtable(L)
// 
// 	This function puts an empty table at the top of the stack.
// 
// lua_next(L, -level)
// 
// 	This function replaces the previous KEY with the new one, and then pushes the new VAULE on top of that. You need to do a pop to stay even.
// 
// And here are some poppers:
// 
// lua_pop(L,number)
// 
// 	This pops off the stack, number levels.
// 
// lua_settable(L, -level)
// 
// 	This pops twice after assigning the key/value pair in the top two stack positions to the table at level -level.




// Table Return Passing Idioms
// When a Lua function called from C returns ends it puts its return values on the stack. When a return value is a table, retrieving the table's elements isn't obvious. Assuming the Lua function returned only one thing and that thing is a table, then that table is at the stack's top when it comes back to C. Here's how you access it:
// 
// lua_pushnil(L);  /* Make sure lua_next starts at beginning */
// const char *k, *v;
// while (lua_next(L, -2)) {                    /* TABLE LOCATED AT -2 IN STACK */
//    v = lua_tostring(L, -1);                 /* Value at stacktop */
//    lua_pop(L,1);                            /* Remove value */
//    k = lua_tostring(L, -1);                 /* Read key at stacktop, */
//                                             /* leave in place to guide next lua_next() */
//    /* Do what you need to with k and v */
// }
// 
// In the preceding, you push a nil in order to make sure lua_next() starts with the first item. The reason you use -2 as an arg to lua_next() is because after you push the nil, the returned table is the second item down on the stack. On each iteration, lua_next() replaces the existing key with the next one, and then pushes the next value on top of it. Therefore to keep things in place you need one pop per cycle.
// 
// On every iteration immediately after lua_next(), the top of the stack is the new value, one down from that is the new key, and one down from that is the table.



