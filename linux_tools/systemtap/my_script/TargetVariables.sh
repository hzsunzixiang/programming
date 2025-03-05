# The probe events that map to actual locations in the code (for example kernel.function("function") and kernel.statement("statement")) allow the use of target variables to obtain the value of variables visible at that location in the code. You can use the -L option to list the target variable available at a probe point. If the debug information is installed for the running kernel, you can run the following command to find out what target variables are available for the vfs_read function:



#-l PROBE
#       Instead  of  running  a  probe  script, just list all available probe points matching the given single probe point.  The pattern may include wildcards and aliases, but not
#       comma-separated multiple probe points.  The process result code will indicate failure if there are no matches.
#
#-L PROBE
#       Similar to "-l", but list probe points and script-level local variables.

stap -L 'kernel.function("vfs_read")'



#stephensun@debian:~/programming/systemtap/my_script$ stap -L 'kernel.function("vfs_read")'
#stap: Symbol `SSL_ImplementedCiphers' has different size in shared object, consider re-linking
#kernel.function("vfs_read@/build/linux-GSgHvp/linux-3.16.39/fs/read_write.c:415") $file:struct file* $buf:char* $count:size_t $pos:loff_t*

# This will yield something similar to the following:
#
# kernel.function("vfs_read@fs/read_write.c:277") $file:struct file* $buf:char* $count:size_t $pos:loff_t*

stap -l 'kernel.function("vfs_read")'

#stephensun@debian:~/programming/systemtap/my_script$ stap -l 'kernel.function("vfs_read")'
#stap: Symbol `SSL_ImplementedCiphers' has different size in shared object, consider re-linking
#kernel.function("vfs_read@/build/linux-GSgHvp/linux-3.16.39/fs/read_write.c:415")



#kernel.function("vfs_read@/build/linux-GSgHvp/linux-3.16.39/fs/read_write.c:415") $file:struct file* $buf:char* $count:size_t $pos:loff_t*
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


stap -e 'probe kernel.function("vfs_read") {
           printf ("current files_stat max_files: %d\n",
                   @var("files_stat@fs/file_table.c")->max_files);
           exit(); }'


#/home/stephensun/kernel/linux/fs/file_table.c

#/* sysctl tunables... */
#struct files_stat_struct files_stat = {
#	.max_files = NR_FILE
#};
#

#stap: Symbol `SSL_ImplementedCiphers' has different size in shared object, consider re-linking
#current files_stat max_files: 99255

stap -e 'probe kernel.function("vfs_read") {printf("%s\n", $$parms); exit(); }'
#stephensun@debian:~/programming/systemtap/my_script$ sudo stap -e 'probe kernel.function("vfs_read") {printf("%s\n", $$parms); exit(); }'
#stap: Symbol `SSL_ImplementedCiphers' has different size in shared object, consider re-linking
#file=0xffff880036b3f700 buf=0x7ffd5c5bf850 count=0x2004 pos=0xffff880015d9bf58



#Having the address a pointer points to may not be useful. Instead the fields of the data structure the pointer
#points to may be of more use. Use the “$” suffix to pretty print the data structure. The following command-line 
#example uses the pretty printing suffix to print more details about the data structures passed into the function vfs_read: 

stap -e 'probe kernel.function("vfs_read") {printf("%s\n", $$parms$); exit(); }'
#stephensun@debian:~/programming/systemtap/my_script$ sudo stap -e 'probe kernel.function("vfs_read") {printf("%s\n", $$parms$); exit(); }'
#stap: Symbol `SSL_ImplementedCiphers' has different size in shared object, consider re-linking
#file={.f_u={...}, .f_path={...}, .f_inode=0xffff8800364c7b48, .f_op=0xffffffffa0547320, .f_lock={...}, .f_count={...}, .f_flags=34818, .f_mode=491551, .f_pos_lock={...}, .f_pos=0, .f_owner={...}, .f_cred=0xffff88003694edc0, .f_ra={...}, .f_version=0, .f_security=0x0, .private_data=0x0, .f_ep_links={...}, .f_tfile_llink={...}, .f_mapping=0xffff8800364c7c98} buf="" count=8196 pos=-131941029150888

#With the “$” suffix fields that are composed of data structures are not expanded. The “$$” suffix will print the values 
#contained within the nested data structures. Below is an example using the “$$” suffix: 

stap -e 'probe kernel.function("vfs_read") {printf("%s\n", $$parms$$); exit(); }'
#stephensun@debian:~/programming/systemtap/my_script$ sudo stap -e 'probe kernel.function("vfs_read") {printf("%s\n", $$parms$$); exit(); }'
#stap: Symbol `SSL_ImplementedCiphers' has different size in shared object, consider re-linking
#file={.f_u={.fu_llist={.next=0x0}, .fu_rcuhead={.next=0x0, .func=0x0}}, .f_path={.mnt=0xffff880039e68960, .dentry=0xffff880003bd5858}, .f_inode=0xffff8800364ee488, .f_op=0xffffffffa055c560, .f_lock={<union>={.rlock={.raw_lock={<union>={.head_tail=196611, .tickets={.head=3, .tail=3}}}}}}, .f_count={.counter=2}, .f_flags=34818, .f_mode=491551, .f_pos_lock={.count={.counter=0}, .wait_lock={<union>={.rlock={.raw_lock={<union>={.head_tail=0, .tickets={.head=0, .tail=0}}}}}}, .wait_list={.next=0xffff88003a281a50
#





