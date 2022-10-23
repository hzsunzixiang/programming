# Triangle

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `triangle` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:triangle, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/triangle>.


# 原视频所在
https://www.youtube.com/watch?v=C5cDXxCMptQ&t=197s

:dbg.start
:dbg.tracer

#:dbg.tpl(Triangle, :area, [])

#Finished in 0.02 seconds (0.00s async, 0.02s sync)
#(<0.162.0>) call 'Elixir.Triangle':area(3,5)
#1 doctest, 1 test, 0 failures


#:dbg.tpl(Triangle, :area, [{:_, [], [{:return_trace}]}])
#Finished in 0.03 seconds (0.00s async, 0.03s sync)
#(<0.163.0>) call 'Elixir.Triangle':area(3,5)
#(<0.163.0>) returned from 'Elixir.Triangle':area/2 -> 7.5
#1 doctest, 1 test, 0 failures
#

:dbg.tpl(Triangle, :_, [{:_, [], [{:return_trace}]}])

#ericksun@centos7-dev:~/programming/elixir/my_elixir/dbg/triangle (master)$ mix test
#(<0.151.0>) call 'Elixir.Triangle':module_info(compile)
#(<0.151.0>) returned from 'Elixir.Triangle':module_info/1 -> [{version,"8.2"},
#                                                              {options,
#                                                               [no_spawn_compiler_process,
#                                                                from_core,
#                                                                no_core_prepare,
#                                                                no_auto_import]},
#                                                              {source,
#                                                               "/home/ericksun/programming/elixir/my_elixir/dbg/triangle/lib/triangle.ex"}]
#(<0.151.0>) call 'Elixir.Triangle':module_info(compile)
#(<0.151.0>) returned from 'Elixir.Triangle':module_info/1 -> [{version,"8.2"},
#                                                              {options,
#                                                               [no_spawn_compiler_process,
#                                                                from_core,
#                                                                no_core_prepare,
#                                                                no_auto_import]},
#                                                              {source,
#                                                               "/home/ericksun/programming/elixir/my_elixir/dbg/triangle/lib/triangle.ex"}]
#(<0.151.0>) call 'Elixir.Triangle':'__info__'(macros)
#(<0.151.0>) returned from 'Elixir.Triangle':'__info__'/1 -> []
#(<0.151.0>) call 'Elixir.Triangle':'__info__'(macros)
#(<0.151.0>) returned from 'Elixir.Triangle':'__info__'/1 -> []
#(<0.162.0>) call 'Elixir.Triangle':hello()
#(<0.162.0>) returned from 'Elixir.Triangle':hello/0 -> world
#.(<0.163.0>) call 'Elixir.Triangle':area(3,5)
#(<0.163.0>) returned from 'Elixir.Triangle':area/2 -> 7.5
#.
#Finished in 0.02 seconds (0.00s async, 0.02s sync)
#1 doctest, 1 test, 0 failures



#:dbg.p(:all, :call)
:dbg.p(:all, [:call, :timestamp])



#(<0.151.0>) call 'Elixir.Triangle':'__info__'(macros) (Timestamp: {1666,
#                                                                   523478,
#                                                                   916236})
#(<0.151.0>) returned from 'Elixir.Triangle':'__info__'/1 -> [] (Timestamp: {1666,
#                                                                            523478,
#                                                                            916238})
#(<0.151.0>) call 'Elixir.Triangle':'__info__'(macros) (Timestamp: {1666,
#                                                                   523478,
#                                                                   916378})
#(<0.151.0>) returned from 'Elixir.Triangle':'__info__'/1 -> [] (Timestamp: {1666,
#                                                                            523478,
#                                                                            916380})
#(<0.162.0>) call 'Elixir.Triangle':hello() (Timestamp: {1666,523478,926937})
#.(<0.162.0>) returned from 'Elixir.Triangle':hello/0 -> world (Timestamp: {1666,
#                                                                          523478,
#                                                                          926952})
#.(<0.163.0>) call 'Elixir.Triangle':area(3,5) (Timestamp: {1666,523478,927038})
#(<0.163.0>) returned from 'Elixir.Triangle':area/2 -> 7.5 (Timestamp: {1666,
#                                                                       523478,
#                                                                       927040})
#
#Finished in 0.02 seconds (0.00s async, 0.02s sync)
#1 doctest, 1 test, 0 failures

