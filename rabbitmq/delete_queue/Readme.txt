


1. 正在被使用

ericksun@debian9-1:~/programming/rabbitmq/delete_queue$ ./delete_queue.py
Traceback (most recent call last):
  File "./delete_queue.py", line 25, in <module>
    channel.queue_delete(queue=queue_name, if_unused=True, if_empty=False)
  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 2520, in queue_delete
    self._flush_output(delete_ok_result.is_ready)
  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 1331, in _flush_output
    raise self._closing_reason  # pylint: disable=E0702
pika.exceptions.ChannelClosedByBroker: (406, "PRECONDITION_FAILED - queue 'hello' in vhost 'vstation' in use")
2. 没有被使用，但是非空


ericksun@debian9-1:~/programming/rabbitmq/delete_queue$ ./delete_queue.py
Traceback (most recent call last):
  File "./delete_queue.py", line 28, in <module>
    channel.queue_delete(queue=queue_name, if_unused=False, if_empty=True)
  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 2520, in queue_delete
    self._flush_output(delete_ok_result.is_ready)
  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 1331, in _flush_output
    raise self._closing_reason  # pylint: disable=E0702
pika.exceptions.ChannelClosedByBroker: (406, "PRECONDITION_FAILED - queue 'hello' in vhost 'vstation' not empty")

