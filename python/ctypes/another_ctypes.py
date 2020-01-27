#!/usr/bin/env python
# -*- coding: utf-8 -*-
from ctypes import (CDLL, byref, Structure, POINTER, c_int,
                    c_void_p, c_long, c_ushort, c_ubyte,
                    c_char, c_char_p, c_void_p)

# CDLL(None) invokes dlopen(NULL), which loads the currently running
# process - in our case Python itself. Since Python is linked with
# libc, readdir_r will be found there.
# Alternatively, we can just explicitly load 'libc.so.6'.
lib = CDLL(None)
print('Loaded lib {0}'.format(lib))

# Describe the types needed for readdir_r.
class DIRENT(Structure):
    _fields_ = [('d_ino', c_long),
                ('d_off', c_long),
                ('d_reclen', c_ushort),
                ('d_type', c_ubyte),
                ('d_name', c_char * 256)]

DIR_p = c_void_p
DIRENT_p = POINTER(DIRENT)
DIRENT_pp = POINTER(DIRENT_p)

# Load the functions we need from the C library. Specify their
# argument and return types.
readdir_r = lib.readdir_r
readdir_r.argtypes = [DIR_p, DIRENT_p, DIRENT_pp]
readdir_r.restype = c_int

## ifndef __USE_FILE_OFFSET64
#extern int readdir_r (DIR *__restrict __dirp,
#		      struct dirent *__restrict __entry,
#		      struct dirent **__restrict __result)
#     __nonnull ((1, 2, 3)) __attribute_deprecated__;
## else
##  ifdef __REDIRECT
#extern int __REDIRECT (readdir_r,
#		       (DIR *__restrict __dirp,
#			struct dirent *__restrict __entry,
#			struct dirent **__restrict __result),
#		       readdir64_r)
#  __nonnull ((1, 2, 3)) __attribute_deprecated__;

opendir = lib.opendir
opendir.argtypes = [c_char_p]
opendir.restype = DIR_p

# extern int closedir (DIR *__dirp) __nonnull ((1));
closedir = lib.closedir
closedir.argtypes = [DIR_p]
closedir.restype = c_int

# extern DIR *opendir (const char *__name) __nonnull ((1));
# opendir's path argument is char*, hence bytes.
path = b'/tmp'
dir_fd = opendir(path)
if not dir_fd:
    raise RuntimeError('opendir failed')

dirent = DIRENT()
result = DIRENT_p()

while True:
    # Note that byref() here is optional since ctypes can do it on its
    # own by observing the argtypes declared for readdir_r. I keep byref
    # for explicitness.
    if readdir_r(dir_fd, byref(dirent), byref(result)):
        raise RuntimeError('readdir_r failed')
    if not result:
        # If (*result == NULL), we're done.
        break
    # dirent.d_name is char[], hence we decode it to get a unicode
    # string.
    print('Found: ' + dirent.d_name.decode('utf-8'))

closedir(dir_fd)
