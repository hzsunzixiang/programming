#include <lua.h>                                /* Always include this when calling Lua */
#include <lauxlib.h>                            /* Always include this when calling Lua */
#include <lualib.h>                             /* Prototype for luaL_openlibs(), */
/*   always include this when calling Lua */

#include <stdlib.h>                             /* For function exit() */
#include <stdio.h>                              /* For input/output */

static void stackDump(lua_State* L);
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

	fprintf(stderr, "before get global----------------");
	stackDump(L);

	// me = { name = "sunzixiang", age = 27}
	//从Lua里面取得me这个table，并压入栈
	lua_getglobal(L, "me");
	if (!lua_istable(L, -1)) {
		printf("error! me is not a table");
	}
	fprintf(stderr, "after get global----------------");
	stackDump(L);
	//往栈里面压入一个key:name
	lua_pushstring(L, "name");
	fprintf(stderr, "after push string----------------");
	stackDump(L);
	//取得-2位置的table，然后把栈顶元素弹出，取出table[name]的值并压入栈
	// lua_gettable 比较特殊 做的一系列操作
	// -2 存放着table  -1 存放着key  
	// lua_gettable 时 把key弹出 把value放进去
	lua_gettable(L, -2);
	stackDump(L);
	//输出栈顶的name
	fprintf(stderr, "name = %s\n", lua_tostring(L, -1));
	fprintf(stderr, "after get table----------------");
	stackDump(L);
	//把栈顶元素弹出去
	lua_pop(L, 1);
	fprintf(stderr, "after pop----------------");
	stackDump(L);
	//压入另一个key:age
	lua_pushstring(L, "age");
	stackDump(L);
	//取出-2位置的table,把table[age]的值压入栈
	lua_gettable(L, -2);
	stackDump(L);
	fprintf(stderr, "age = %td", lua_tointeger(L, -1));
	return 0;
}
static void stackDump(lua_State* L){
	printf("\nbegin dump lua stack\n");
	int i = 0;
	int top = lua_gettop(L);
	for (i = 1; i <= top; ++i) {
		int t = lua_type(L, i);
		switch (t) {
			case LUA_TSTRING:
				{
					printf("###string### '%s' ", lua_tostring(L, i));
				}
				break;
			case LUA_TBOOLEAN:
				{
					printf(lua_toboolean(L, i) ? "true " : "false ");
				}break;
			case LUA_TNUMBER:
				{
					printf("%g ", lua_tonumber(L, i));
				}
				break;
			default:
				{
					printf("type- ###%s### \n", lua_typename(L, t));
				}
				break;
		}
	}
	printf("\nend dump lua stack\n\n");
}
