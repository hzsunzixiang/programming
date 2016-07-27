#Strings

#len:

  len(`hello')                     # -> 5

#substr:

  substr(`hello', 1, 3)            # -> ell
  substr(`hello', 2)               # -> llo

#index:

  index(`hello',`llo')             # -> 2
  index(`not in string', `xyz')    # -> -1

#translit:

  define(`ALPHA', `abcdefghijklmnopqrstuvwxyz')
  define(`ALPHA_UPR', `ABCDEFGHIJKLMNOPQRSTUVWXYZ')
  define(`ROT13', `nopqrstuvwxyzabcdefghijklm')
  
  translit(`abc ebg13', ALPHA, ALPHA_UPR)
  # -> ABC EBG13
  
  translit(`abc ebg13', ALPHA, ROT13)
  # -> nop rot13

#GNU m4 includes some additional string macros: regexp, to search for a regular expression in a string, and patsubst, to do find and replace.

#Unfortunately, m4's usual approach of rescanning the expansion of a macro can be a problem with macros that operate on strings:

  define(`eng',`engineering')
  substr(`engineer',0,3)           # -> eng -> engineering
  translit(`rat', ALPHA, ROT13)    # -> eng -> engineering

#This is not normally the desired behaviour and is arguably a design bug in m4: the builtins should at least provide some way to allow us to prevent the extracted or transformec substring from being expanded. A workaround is suggested below. 
