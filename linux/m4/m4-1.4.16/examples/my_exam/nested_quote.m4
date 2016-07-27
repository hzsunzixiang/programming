# If rescanning of a macro's expansion is not what you want then just add more quotes:

define(`stmt',``define(`Y',`yyy')'')
stmt                # -> define(`Y',`yyy')
Y                   # -> Y

