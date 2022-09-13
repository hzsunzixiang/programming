%erl -pa bsc/ebin/
% 用这个文件来生成 boot文件
-module(handle_release_appup).
-compile(export_all).
-compile(nowarn_export_all).

start() -> 
    %% 生成boot和script文件
    %systools:make_script("coffee-1.0", [{path, ["coffee-1.0/ebin"]}]),
    %% 生成tar包 /data/github/otp-install/lib/erlang/lib
	%%systools:make_tar ("coffee-1.0",[{erts, "/usr/lib64/erlang"}, {path, ["coffee-1.0/ebin"]}, {outdir, "ernie"}]),
	%systools:make_tar ("coffee-1.0",[{erts, "/data/github/otp-install/lib/erlang"}, {path, ["coffee-1.0/ebin"]}, {outdir, "ernie"}]),



    % 生成boot和script文件
	systools:make_script("coffee-1.1", [{path, ["coffee-1.1/ebin"]}]),
	systools:make_relup ("coffee-1.1", ["coffee-1.0"], ["coffee-1.0"],[{path, ["coffee*/ebin"]}]),
    % 生成tar包 /data/github/otp-install/lib/erlang/lib
	systools:make_tar("coffee-1.1", [{path, ["coffee-1.1/ebin"]}, {outdir, "ernie/releases"}]),
	'this is an end'.
