coffee
=====

An OTP application

Build
-----

    $ rebar3 compile


不能添加 point_of_no_return， 不然报错

true}])===> Error generating relup:
No release upgrade script entry for coffee-0.2.0 to coffee-0.1.0 in file /home/ericksun/programming/erlang/my_erlang/upgrade_1/coffee/_build/default
/rel/coffee/lib/coffee-0.2.0/ebin/coffee.appup


 {"0.2.0",
        [
            {"0.1.0",
-                       [],
-                       [point_of_no_return]
+                       [
+            ]
+                       %[],
+                       %[point_of_no_return]
                }
        ],
        [
            {"0.1.0",
-                       [],
-                       [point_of_no_return]
+                       [
+            ]
+                       %[],
+                       %[point_of_no_return]
                }
        ]
 }.

