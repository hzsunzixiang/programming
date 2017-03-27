# The probe events that map to actual locations in the code (for example kernel.function("function") and kernel.statement("statement")) allow the use of target variables to obtain the value of variables visible at that location in the code. You can use the -L option to list the target variable available at a probe point. If the debug information is installed for the running kernel, you can run the following command to find out what target variables are available for the vfs_read function:

stap -L 'kernel.function("vfs_read")'

# This will yield something similar to the following:
#
# kernel.function("vfs_read@fs/read_write.c:277") $file:struct file* $buf:char* $count:size_t $pos:loff_t*



#kernel.function("vfs_read@fs/read_write.c:277") $file:struct file* $buf:char* $count:size_t $pos:loff_t*
#对应参数
#ssize_t vfs_read(struct file *file, char __user *buf, size_t count, loff_t *pos)
#{
#    ssize_t ret;
#
#    if (!(file->f_mode & FMODE_READ))
#        return -EBADF;
#    if (!(file->f_mode & FMODE_CAN_READ))
#        return -EINVAL;
#    if (unlikely(!access_ok(VERIFY_WRITE, buf, count)))
#        return -EFAULT;
#
#    ret = rw_verify_area(READ, file, pos, count);
#    if (!ret) {
#        if (count > MAX_RW_COUNT)
#            count =  MAX_RW_COUNT;
#        ret = __vfs_read(file, buf, count, pos);
#        if (ret > 0) {
#            fsnotify_access(file);
#            add_rchar(current, ret);
#        }
#        inc_syscr(current);
#    }
#
#    return ret;
#}




# Each target variable is proceeded by a “$” and the type of the target variable follows the “:”. 
#The kernel's vfs_read function has $file (pointer to structure describing the file), 
#$buf (pointer to the user-space memory to store the read data), $count (number of bytes to read),
#and $pos (position to start reading from in the file) target variables at the entry to the function.
# When a target variable is not local to the probe point, 
#like a global external variable or a file local static variable 
#defined in another file then it can be referenced through “@var("varname@src/file.c")”. 

