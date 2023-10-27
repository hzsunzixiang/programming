-module(create_tables).

%-export([init_tables/0, insert_user/3, insert_project/2]).
-compile([export_all]).
-compile(nowarn_export_all).
-include_lib("stdlib/include/qlc.hrl").

-record(user, {
          id,
          name
         }).

-record(project, {
          title,
          description
         }).

-record(contributor, {
          user_id,
          project_title
         }).

init_tables() ->
    mnesia:create_table(user,
       [{attributes, record_info(fields, user)}]),
    mnesia:create_table(project,
       [{attributes, record_info(fields, project)}]),
    mnesia:create_table(contributor,
       [{type, bag}, {attributes, record_info(fields, contributor)}]).

insert_user(Id, Name, ProjectTitles) when ProjectTitles =/= [] ->
    User = #user{id = Id, name = Name},
    Fun = fun() ->
            mnesia:write(User),
            lists:foreach(
              fun(Title) ->
                [#project{title = Title}] = mnesia:read(project, Title),
                mnesia:write(#contributor{user_id = Id,
                                          project_title = Title})
              end,
              ProjectTitles)
          end,
    mnesia:transaction(Fun).

insert_project(Title, Description) ->
    mnesia:dirty_write(#project{title = Title,
                                description = Description}).
init_mnesia()->
    mnesia:create_schema([node()]),
    application:set_env(mnesia, dir, "./mnesia_store"),
    mnesia:start().

start() ->
   init_mnesia(),
   init_tables(),
   mnesia:info(),
   insert_project(simple_cache, "a simple cache application"),
   insert_user(20, pony,[simple_cache]),
   insert_user(30, tony,[simple_cache]),
   insert_user(31, martin,[simple_cache]),
   Contributor = mnesia:dirty_read(contributor, 10),
   io:format("Contributor:~p~n", [Contributor]),
   DirtyRead = mnesia:dirty_read(contributor, 10),
   io:format("DirtyRead:~p~n", [DirtyRead]),
   Select = mnesia:transaction(
   fun() ->
   mnesia:select(user, [{#user{id = '$1', name = martin}, [], ['$1']}])
   end),
   io:format("Select:~p~n", [Select]),

   Select2 = mnesia:transaction(
      fun() ->
         Table = mnesia:table(user),
         QueryHandle = qlc:q([U#user.id || U <- Table, U#user.name =:= pony]),
         qlc:eval(QueryHandle)
   end),
   io:format("Select2:~p~n", [Select2]),
   finish.





