
Eshell V13.0.4  (abort with ^G)
1> observer:start().
ok
2> error_logger:error_report("Serious error in my module").
=ERROR REPORT==== 30-Oct-2022::23:11:27.965040 ===
Serious error in my module
ok
3> custom_error_report:register_with_logger().
ok
4> error_logger:error_report("Serious error in my module").
ERROR <<0.81.0>> "Serious error in my module"=ERROR REPORT==== 30-Oct-2022::23:11:38.085997 ===
Serious error in my module
ok



logger_sup 下面会多一个进程 error_logger
