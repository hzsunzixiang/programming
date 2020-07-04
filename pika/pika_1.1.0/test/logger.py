# -*- encoding:utf-8 -*-
import logging
import sys
sys.path.append("..")
# create logger
LOGGER = logging.getLogger("pika")
LOGGER.setLevel(logging.DEBUG)
fh = logging.StreamHandler(sys.stderr)

fh.setLevel(logging.DEBUG)
# create formatter
fmt = "%(asctime)-15s %(levelname)s %(filename)s %(lineno)d %(process)d %(message)s"
datefmt = "%a %d %b %Y %H:%M:%S"
formatter = logging.Formatter(fmt, datefmt)

# add handler and formatter to logger
fh.setFormatter(formatter)
LOGGER.addHandler(fh)

