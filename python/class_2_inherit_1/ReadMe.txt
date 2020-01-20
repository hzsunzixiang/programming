


演示两个类同时继承一个基类的情况

CBaseOp.process 被调用两次 有递归调用 

CCbsCgwAttachVolumeHandle.process 
	在基类中定义  process(CBaseOp ) -> do_process  (CCbsCgwVolumeHandle) -> do_op_cbs (CCbsCgwVolumeHandle) -> get_cbs_op (CCbsCgwAttachVolumeHandle)
	返回对象 CbsCgwAttachVolumeOp 调用 process (CBaseOp) ->  do_process (CHttpOp)

#   CCbsCgwAttachVolumeHandle.process 
#   CBaseOp.process    只有基类中有定义      process 
#   CCbsCgwVolumeHandle.do_process
#   get_cbs_op (CCbsCgwAttachVolumeHandle)     CCbsCgwVolumeHandle调用，定义在 CCbsCgwAttachVolumeHandle  返回 CbsCgwAttachVolumeOp

#   CbsCgwAttachVolumeOp.process  开始调用    
#   最终调用基类的 CBaseOp.process  调用 do_process
#   CHttpOp.do_process    



python -m pdb main.py  追踪调用栈
(Pdb) bt
  /usr/lib/python2.7/bdb.py(400)run()
-> exec cmd in globals, locals
  <string>(1)<module>()
  /home/ericksun/programming/python/class_2_inherit_1/main.py(82)<module>()
-> op.process()
  /home/ericksun/programming/python/class_2_inherit_1/main.py(21)process()
-> self.do_process()
  /home/ericksun/programming/python/class_2_inherit_1/main.py(42)do_process()
-> ret = self.do_op_cbs(item)
  /home/ericksun/programming/python/class_2_inherit_1/main.py(37)do_op_cbs()
-> reply = op.process()
  /home/ericksun/programming/python/class_2_inherit_1/main.py(21)process()
-> self.do_process()
> /home/ericksun/programming/python/class_2_inherit_1/main.py(54)do_process()->None
-> print("in CHttpOp do_process module_name:%s, interface_name:%s"%(self.get_module_name(), self.get_interface_name()))

