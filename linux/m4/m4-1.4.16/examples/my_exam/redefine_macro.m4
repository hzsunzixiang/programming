define(`args', ``NAME', `Marie'')
define(args)                   # -> define(`NAME', `Marie') ->
NAME                           # -> Marie

args(define(`args',`Rachel'))  # -> args() -> `NAME', `Marie' -> NAME, Marie
args                           # -> Rachel
