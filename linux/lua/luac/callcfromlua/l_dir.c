// https://www.lua.org/pil/26.2.html
// typedef int (*lua_CFunction) (lua_State *L);
// lua.h

#include <lua.h>                               /* Always include this */
#include <lauxlib.h>                           /* Always include this */
#include <lualib.h>                            /* Always include this */
#include <math.h>                            /* Always include this */
#include <dirent.h>
#include <errno.h>
#include <string.h>

static int l_dir (lua_State *L) {
	DIR *dir;
	struct dirent *entry;
	int i;
	const char *path = luaL_checkstring(L, 1);

	/* open directory */
	dir = opendir(path);
	if (dir == NULL) {  /* error opening the directory? */
		lua_pushnil(L);  /* return nil and ... */
		lua_pushstring(L, strerror(errno));  /* error message */
		return 2;  /* number of results */
	}

	/* create result table */
	lua_newtable(L);
	i = 1;
	while ((entry = readdir(dir)) != NULL) {
		lua_pushnumber(L, i++);  /* push key */
		lua_pushstring(L, entry->d_name);  /* push value */
		lua_settable(L, -3);
	}

	closedir(dir);
	return 1;  /* table is already on top */
}
// this format can not work in 5.1
//static const struct luaL_reg mylib [] = {
//	{"mydir", l_dir},
//	{NULL, NULL}  /* sentinel */
//};
//int luaopen_mylib (lua_State *L) {
//	luaL_openlib(L, "mylib", mylib, 0);
//	return 1;
//}
int luaopen_mylib(lua_State *L){
	lua_register(
			L,               /* Lua state variable */
			"mydir",        /* func name as known in Lua */
			l_dir/* func name in this file */
			);  
	return 0;
}
