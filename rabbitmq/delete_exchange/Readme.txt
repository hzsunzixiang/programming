


1. 正在被使用

ericksun@debian9-1:~/programming/rabbitmq/delete_exchange$ ./delete_exchange.py
Traceback (most recent call last):
  File "./delete_exchange.py", line 25, in <module>
    channel.exchange_delete(exchange=exchange, if_unused=True)
  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 2399, in exchange_delete
    self._flush_output(delete_ok_result.is_ready)
  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 1331, in _flush_output
    raise self._closing_reason  # pylint: disable=E0702
pika.exceptions.ChannelClosedByBroker: (406, "PRECONDITION_FAILED - exchange 'vstation' in vhost 'vstation' in use")

