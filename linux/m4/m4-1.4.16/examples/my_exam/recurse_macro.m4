define(`len_my',`ifelse($1,,0,`eval(1+len_my(substr($1,1)))')')
len_my(`xyz')
