// https://www.lua.org/pil/26.2.html
// typedef int (*lua_CFunction) (lua_State *L);
// lua.h

#include <lua.h>                               /* Always include this */
#include <lauxlib.h>                           /* Always include this */
#include <lualib.h>                            /* Always include this */
#include <math.h>                            /* Always include this */


static int l_sin (lua_State *L) {
	double d = lua_tonumber(L, 1);  /* get argument */
	lua_pushnumber(L, sin(d));  /* push result */
	return 1;  /* number of results */
}


static int l_sin1 (lua_State *L) {
	double d = luaL_checknumber(L, 1);
	lua_pushnumber(L, sin(d));
	return 1;  /* number of results */
}


int luaopen_mysin(lua_State *L){
	lua_register(
			L,               /* Lua state variable */
			"mysin",        /* func name as known in Lua */
			l_sin/* func name in this file */
			);  
	lua_register(L,"mysin1", l_sin1);
	return 0;
}
