#!/usr/bin/env python
# -*- coding: utf-8 -*-

from ctypes import cdll, Structure, c_int, c_double, c_uint

lib = cdll.LoadLibrary('./libsomelib.so')
print('Loaded lib {0}'.format(lib))

# Describe the DataPoint structure to ctypes.
class DataPoint(Structure):
    _fields_ = [('num', c_int),
                ('dnum', c_double)]

# Initialize the DataPoint[4] argument. Since we just use the DataPoint[4]
# type once, an anonymous instance will do.
dps = (DataPoint * 4)((2, 2.2), (3, 3.3), (4, 4.4), (5, 5.5))

# Grab add_data from the library and specify its return type.
# Note: .argtypes can also be specified
add_data_fn = lib.add_data
add_data_fn.restype = DataPoint

print('Calling add_data via ctypes')
dout = add_data_fn(dps, 4)
print('dout = {0}, {1}'.format(dout.num, dout.dnum))
