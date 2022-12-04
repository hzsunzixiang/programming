

3> code:load_file(code_lock).
{module,code_lock}
4> recon_trace:calls([{code_lock, '_', fun(_) -> return_trace() end}], 10000, [return_to,{scope, local}]).
11

code:load_file(code_lock).
recon_trace:calls([{code_lock, '_', fun(_) -> return_trace() end}], 10000, [return_to,{scope, local}]).
