


#  演示 	behaviour_info(callbacks) -> Callbacks.

The callback functions of the module can be specified either directly by the exported function behaviour_info/1:

behaviour_info(callbacks) -> Callbacks.
or by a -callback attribute for each callback function:

-callback Name(Arguments) -> Result.

