# When a target variable is not local to the probe point, like a global external variable or a file local static variable defined in another file then it can be referenced through “@var("varname@src/file.c")”.
#SystemTap tracks the typing information of the target variable and can examine the fields of a structure with the -> operator. The -> operator can be chained to look at data structures contained within data structures and follow pointers to other data structures. The -> operator will obtain the value in the field of the structure. The -> operator is used regardless whether accessing a field in a substructure or accessing another structure through a pointer.
#For example to access a field of the static files_stat target variable defined in fs/file_table.c (which holds some of the current file system sysctl tunables), one could write: 

stap -e 'probe kernel.function("vfs_read") {
           printf ("current files_stat max_files: %d\n",
                   @var("files_stat@fs/file_table.c")->max_files);
           exit(); }'
