

成功了 


erl -noshell -s amqp_example start -s init stop
{"init terminating in do_boot",{undef,[{amqp_connection,start,[{amqp_params_network,vstation,vstation,vstation,'192.168.142.130',5672,0,0,10,infinity,none,[fun amqp_auth_mechanisms:plain/3,fun amqp_auth_mechanisms:amqplain/3],[],[]}],[]},{amqp_example,test,0,[{file,"amqp_example.erl"},{line,46}]},{amqp_example,start,0,[{file,"amqp_example.erl"},{line,80}]},{init,start_em,1,[]},{init,do_boot,3,[]}]}}
init terminating in do_boot ({undef,[{amqp_connection,start,[{_}],[]},{amqp_example,test,0,[{_},{_}]},{amqp_example,start,0,[{_},{_}]},{init,start_em,1,[]},{init,do_boot,3,[]}]})

