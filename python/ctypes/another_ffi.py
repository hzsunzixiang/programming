#!/usr/bin/env python
# -*- coding: utf-8 -*-


from cffi import FFI

ffi = FFI()
ffi.cdef("""
    typedef void DIR;
    typedef long ino_t;
    typedef long off_t;

    struct dirent {
        ino_t          d_ino;       /* inode number */
        off_t          d_off;       /* offset to the next dirent */
        unsigned short d_reclen;    /* length of this record */
        unsigned char  d_type;      /* type of file; not supported
                                       by all file system types */
        char           d_name[256]; /* filename */
    };

    DIR *opendir(const char *name);
    int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result);
    int closedir(DIR *dirp);
""")

# Loaded lib <cffi.api.FFILibrary object at 0x7f8c4383bbd0>

# Load symbols from the current process (Python).
lib = ffi.dlopen(None)
print('Loaded lib {0}'.format(lib))

path = b'/tmp'
dir_fd = lib.opendir(path)
if not dir_fd:
    raise RuntimeError('opendir failed')

# Allocate the pointers passed to readdir_r.
dirent = ffi.new('struct dirent*')
result = ffi.new('struct dirent**')

while True:
    if lib.readdir_r(dir_fd, dirent, result):
        raise RuntimeError('readdir_r failed')
    if result[0] == ffi.NULL:
        # If (*result == NULL), we're done.
        break
    print('Found: ' + ffi.string(dirent.d_name).decode('utf-8'))

lib.closedir(dir_fd)
