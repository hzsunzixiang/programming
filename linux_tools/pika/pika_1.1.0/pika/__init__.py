__version__ = '1.1.0'

import logging

# Add NullHandler before importing Pika modules to prevent logging warnings
logging.getLogger(__name__).addHandler(logging.NullHandler())

# pylint: disable=C0413

from pika.connection import ConnectionParameters
from pika.connection import URLParameters
from pika.connection import SSLOptions
from pika.credentials import PlainCredentials
from pika.spec import BasicProperties

from pika.adapters import BaseConnection
from pika.adapters import BlockingConnection
from pika.adapters import SelectConnection

from pika.adapters.utils.connection_workflow import AMQPConnectionWorkflow


LOGGER = logging.getLogger(__name__)
