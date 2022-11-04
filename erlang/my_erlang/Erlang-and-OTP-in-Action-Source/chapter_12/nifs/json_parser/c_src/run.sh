 gcc -o ./priv/jp_nifs.so -fpic -shared -I/home/ericksun/program/otp-25.0.4/lib/erlang/erts-13.0.4/include  -I/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/plain_port/json_parser/yajl_install/include/ -L/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/plain_port/json_parser/yajl_install/lib/ c_src/jp_nifs_R14.c -lyajl

