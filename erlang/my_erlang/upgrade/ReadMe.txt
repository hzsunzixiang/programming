		  
1. rebar.config 中的  {dev_mode, false},

2. coffee.apppup.src 中的标志位
true}])===> Error generating relup:
          No release upgrade script entry for coffee-0.2.0 to coffee-0.1.0 in file /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/rebar3_coffee/coffee/_build/default/rel/coffee/lib/coffee-0.2.0/ebin/coffee.appup
		  
		 
# https://stackoverflow.com/questions/74784183/upgrade-of-erlang-applications-based-on-relup-by-rebar3/74810806#74810806

我自己的回答

After many times of retry and experiment, I found it in this artical.

Hot code reloading with Erlang and Rebar3

The answer is such as：

rebar3 relup -n nine9s -v "0.2.0" -u "0.1.0"
However, there are some issues needed to be attentioned.

# 注意的第1点 
The rebar.config file

You should replace the default options {mode, dev} with {dev_mode, false}

# 注意的第2点 
the *.appup.src 
You cannot include the point_of_no_return option in this file, otherwise there will be some problem such as:
No release upgrade script entry for xxxx-0.2.0 to xxxx-0.1.0 in file 


