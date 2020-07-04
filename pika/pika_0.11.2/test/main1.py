# -*- encoding:utf-8 -*-
import logging
import sys
sys.path.append("..")
import pika
from pika import callback
from datetime import datetime


# create logger
LOGGER = logging.getLogger("pika")
LOGGER.setLevel(logging.DEBUG)

# create file handler
log_path = "./log.log"
fh = logging.FileHandler(log_path)

# fh = logging.StreamHandler(sys.stderr)

fh.setLevel(logging.DEBUG)

# create formatter
fmt = "%(asctime)-15s %(levelname)s %(filename)s %(lineno)d %(process)d %(message)s"
datefmt = "%a %d %b %Y %H:%M:%S"
formatter = logging.Formatter(fmt, datefmt)

# add handler and formatter to logger
fh.setFormatter(formatter)
LOGGER.addHandler(fh)

# print log info
LOGGER.debug('debug message in main ')
# LOGGER.info('info message')
# LOGGER.warn('warn message')
# LOGGER.error('error message')
# LOGGER.critical('critical message')
callback.test_ericskun()
