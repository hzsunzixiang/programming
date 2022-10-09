

这个还没有实验出来  2022.10.8

试验出来了； 2022.10.9 : 原因是 
这行写错了
    proc_lib:start_link(Module, init, [self(), Module, InitialState, Deb]).
应该为
    proc_lib:start_link(?MODULE, init, [self(), Module, InitialState, Deb]).



目前这里还不能调试：  2022.10.9 
