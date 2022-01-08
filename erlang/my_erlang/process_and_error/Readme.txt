Erlang的惯用法之一就是在消息匹配的时候，如果需要唯一性，通常会通过make_ref搞个唯一的Ref来作为消息的一部分来匹配。这个惯用法用在gen_server:call或者demonitor这样的使用频度很高的函数里面。由于erlang的消息匹配是再消息队列里面挨个遍历来匹配，特别是消息队列特别长的时候，会有很大的性能瓶颈。于是新的优化出现了，以下是编译器beam_receive.erl里面的解释，写的很清楚：

view sourceprint?
%%%                                                                                                                                                                   
%%% In code such as:                                                                                                                                                  
%%%                                                                                                                                                                   
%%%    Ref = make_ref(),        %Or erlang:monitor(process, Pid)                                                                                                      
%%%      .                                                                                                                                                            
%%%      .                                                                                                                                                            
%%%      .                                                                                                                                                            
%%%    receive                                                                                                                                                        
%%%       {Ref,Reply} -> Reply                                                                                                                                        
%%%    end.                                                                                                                                                           
%%%                                                                                                                                                                   
%%% we know that none of the messages that exist in the message queue                                                                                                 
%%% before the call to make_ref/0 can be matched out in the receive                                                                                                   
%%% statement. Therefore we can avoid going through the entire message                                                                                                
%%% queue if we introduce two new instructions (here written as                                                                                                       
%%% BIFs in pseudo-Erlang):                                                                                                                                           
%%%                                                                                                                                                                   
%%%    recv_mark(SomeUniqInteger),                                                                                                                                    
%%%    Ref = make_ref(),                                                                                                                                              
%%%      .                                                                                                                                                            
%%%      .                                                                                                                                                            
%%%      .                                                                                                                                                            
%%%    recv_set(SomeUniqInteger),                                                                                                                                     
%%%    receive                                                                                                                                                        
%%%       {Ref,Reply} -> Reply                                                                                                                                        
%%%    end.                                                                                                                                                           
%%%                                                                                                                                                                   
%%% The recv_mark/1 instruction will save the current position and                                                                                                    
%%% SomeUniqInteger in the process context. The recv_set                                                                                                              
%%% instruction will verify that SomeUniqInteger is still stored                                                                                                      
%%% in the process context. If it is, it will set the current pointer                                                                                                 
%%% for the message queue (the next message to be read out) to the                                                                                                    
%%% position that was saved by recv_mark/1.                                                                                                                           
%%%   
%%% The remove_message instruction must be modified toinvalidate                                                                                                     
%%% the information stored by the previous recv_mark/1, in case there                                                                                                 
%%% is another receive executed between the calls to recv_mark/1 and                                                                                                  
%%% recv_set/1.                                                                                                                                                       
%%%                                                                                                                                                                   
%%% We use a reference to a label (i.e. a position in the loaded code)                                                                                                
%%% as the SomeUniqInteger.                                                                                                                                           
%%%         
