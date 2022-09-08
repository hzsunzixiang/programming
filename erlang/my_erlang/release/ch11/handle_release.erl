%erl -pa bsc/ebin/
% 用这个文件来生成 boot文件
-module(handle_release).
-compile(export_all).
-compile(nowarn_export_all).

start() -> 
    systools:make_script("basestation", [{path, ["bsc/ebin"]}]),
	'this is an end'.
