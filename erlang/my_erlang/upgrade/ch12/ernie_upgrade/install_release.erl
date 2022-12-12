%erl -pa bsc/ebin/
% 用这个文件来生成 boot文件
-module(install_release).
-compile(export_all).
-compile(nowarn_export_all).

% 需要再erl命令下执行
start() -> 
    ReleaseName="coffee-1.1",
    application:which_applications(),
    release_handler:unpack_release(ReleaseName),
    release_handler:install_release("1.1"),

	'this is an end'.




