Traceback (most recent call last):
  File "receive.py", line 15, in <module>
    no_ack=True)
TypeError: basic_consume() got multiple values for keyword argument 'queue'



解决方案

just change

channel.basic_consume(callback, queue='hello', no_ack=True)
to

channel.basic_consume('hello', callback, auto_ack=True)
