ExUnit.start()

:dbg.start
:dbg.tracer
:dbg.tpl(Triangle, :_, [{:_, [], [{:return_trace}]}])
:dbg.p(:all, [:call, :timestamp])

#:dbg.tpl(Triangle, :area, [])

#Finished in 0.02 seconds (0.00s async, 0.02s sync)
#(<0.162.0>) call 'Elixir.Triangle':area(3,5)
#1 doctest, 1 test, 0 failures


#:dbg.tpl(Triangle, :area, [{:_, [], [{:return_trace}]}])
#Finished in 0.03 seconds (0.00s async, 0.03s sync)
#(<0.163.0>) call 'Elixir.Triangle':area(3,5)
#(<0.163.0>) returned from 'Elixir.Triangle':area/2 -> 7.5

#:dbg.tpl(Triangle, :_, [{:_, [], [{:return_trace}]}])

#.....
#(<0.162.0>) returned from 'Elixir.Triangle':hello/0 -> world
#.(<0.163.0>) call 'Elixir.Triangle':area(3,5)
#(<0.163.0>) returned from 'Elixir.Triangle':area/2 -> 7.5



#:dbg.p(:all, :call)
#:dbg.p(:all, [:call, :timestamp])


# ....
#(<0.162.0>) call 'Elixir.Triangle':hello() (Timestamp: {1666,523478,926937})
#.(<0.162.0>) returned from 'Elixir.Triangle':hello/0 -> world (Timestamp: {1666,
#                                                                          523478,
#                                                                          926952})
#.(<0.163.0>) call 'Elixir.Triangle':area(3,5) (Timestamp: {1666,523478,927038})
#(<0.163.0>) returned from 'Elixir.Triangle':area/2 -> 7.5 (Timestamp: {1666,
#                                                                       523478,
#                                                                       927040})
