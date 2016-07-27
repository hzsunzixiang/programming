# A deficiency of m4 is that there is no escape character. This means that if you want to use the backtick (`) for anything other than an opening quote delimiter you need to take care. Sometimes you can just add an extra layer of quotes:

#  I said, ``Quote me.''     # -> I said, `Quote me.'

#However, in other cases, you might need an opening quote without m4 interpreting it as such.

#The general way around this problem is to use the changequote macro, e.g.,

``Quote me.''     # -> I said, `Quote me.'
changequote(<!,!>)
a `quo<!ted str!>ing'

#outputs

#  a `quoted string'

