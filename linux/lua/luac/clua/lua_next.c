#include <lauxlib.h>
#include <lua.h>
#include <lualib.h>                             /* Prototype for luaL_openlibs(), */

// http://stackoverflow.com/questions/6137684/iterate-through-lua-table
static void iterate_and_print(lua_State *L, int index);

int main(int ac, char **av)
{
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);

	// int luaL_loadstring (lua_State *L, const char *s);
	// Loads a string as a Lua chunk. This function uses lua_load to load the chunk in the zero-terminated string s.

	// 	This function returns the same results as lua_load.

	// 	Also as lua_load, this function only loads the chunk; it does not run it.
	// Create a table and put it on the top of the stack
	luaL_loadstring(L, "return {one=1,[2]='two',three=3}");
	lua_call(L, 0, 1);

	iterate_and_print(L, -1);
	return 0;
}

static void iterate_and_print(lua_State *L, int index)
{
	// Push another reference to the table on top of the stack (so we know
	// where it is, and this function can work for negative, positive and
	// pseudo indices

 	// lua_pushvalue
 	// void lua_pushvalue (lua_State *L, int index);
 	// Pushes a copy of the element at the given valid index onto the stack
	// 这里 push 最后再pop 恢复原状
	// push table 的一个副本 然后再移除
	lua_pushvalue(L, index);
	// stack now contains: -1 => table
	// 这里pushnil 是为了 在 lua_next 的时候参数为-2
	lua_pushnil(L);
	// stack now contains: -1 => nil; -2 => table
	while (lua_next(L, -2))
	{
		// stack now contains: -1 => value; -2 => key; -3 => table
		// copy the key so that lua_tostring does not modify the original
		lua_pushvalue(L, -2);
		// stack now contains: -1 => key; -2 => value; -3 => key; -4 => table
		const char *key = lua_tostring(L, -1);
		const char *value = lua_tostring(L, -2);
		printf("%s => %s\n", key, value);
		// lua_pop
		// void lua_pop (lua_State *L, int n);
		// Pops n elements from the stack.
		// pop value + copy of key, leaving original key
		lua_pop(L, 2);
		// stack now contains: -1 => key; -2 => table
	}
	// stack now contains: -1 => table (when lua_next returns 0 it pops the key
	// but does not push anything.)
	// Pop table
	lua_pop(L, 1);
	// Stack is now the same as it was on entry to this function
}



