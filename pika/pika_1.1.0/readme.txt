https://github.com/pika/pika/issues/692



IIRC, pika nicely adheres to Python logging, so you may use either of the following:

# reduce log level
logging.getLogger("pika").setLevel(logging.WARNING)

# or, disable propagation
logging.getLogger("pika").propagate = False
The first one reduces the log level of the logger used by pika to WARNING. The second one disables propagation of log messages to the root logger. You should probably use the first one as it will still show error and critical/fatal logs from pika.

The python logging docs are very helpful:
https://docs.python.org/2/library/logging.html

HTH,
