#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
import subprocess
import socket
import multiprocessing
import time
import datetime
import logging
from logging.handlers import TimedRotatingFileHandler


LOG_FORMAT = "%(asctime)s [%(threadName)-12.12s] [%(levelname)-5.5s]  %(message)s"
DATE_FORMAT = "%m/%d/%Y %H:%M:%S %p"

logging.basicConfig(filename='../log/crontab.log', level=logging.DEBUG, format=LOG_FORMAT, datefmt=DATE_FORMAT)

LOG = logging.getLogger()


RABBITMQ_BIN_PATH = os.environ.get('MQ_HOME', '')
RABBITMQ_CTRL = os.path.join(RABBITMQ_BIN_PATH, './sbin/rabbitmqctl')


def get_conntions():
    # ./rabbitmqctl list_connections pid name port host peer_port peer_host
    cmd = '%s list_connections peer_host' % RABBITMQ_CTRL
    LOG.info(cmd)
    child = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    stdout, stderr = child.communicate()
    return stdout


def check_ping(ip):
    response = os.system("ping -c 1 -w 3 " + ip + " >/dev/null 2>&1")
    # and then check the response...
    if response == 0:
        pingstatus = True
        # pingstatus = "Network Active"
    else:
        pingstatus = False
        # pingstatus = "Network Error"

    return pingstatus


def get_connections_ip():
    """
    获取连接到当前MQ的所有连接
    :return:
    """
    ip_set = set()
    stdout = get_conntions()
    if stdout:
        for x in stdout.split():
            try:
                socket.inet_aton(x)
                ip_set.add(x)
            except socket.error:
                pass
    return ip_set


def get_connection_pid(ip):
    """
    获取rabbimq的erlang进程号
    :param ip:
    :return:
    """
    pid_set = set()

    cmd = '%s list_connections pid peer_host | grep %s' % (RABBITMQ_CTRL, ip)
    LOG.info(cmd)
    child = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    stdout, stderr = child.communicate()
    if stdout:
        for x in stdout.split('\n'):
            if not x:
                continue
            pid = x.split()[0]
            pid_set.add(pid)
    return pid_set


def close_connection(pid):
    cmd = '%s close_connection "%s" close_by_notify' % (RABBITMQ_CTRL, pid)
    LOG.info(cmd)
    child = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    stdout, stderr = child.communicate()
    if stdout:
        LOG.info(stdout)


def main():
    LOG.info('time %s start check.' % datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    ip_set = get_connections_ip()
    LOG.info(ip_set)
    # ip_set.add('10.232.86.106')
    pool = multiprocessing.Pool(processes=1)
    for ip in ip_set:
        if check_ping(ip):
            LOG.info('ping %s ok' % ip)
            continue

        LOG.info('ip connect fail %s' % ip)
        pid_set = get_connection_pid(ip)
        for pid in pid_set:
            LOG.info('close pid %s' % pid)
            pool.apply_async(close_connection, (pid,))
    pool.close()
    pool.join()
    LOG.info('time %s check done...' % datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    os.system("[ $(ps -ef | grep rabbit | grep -v grep | wc -l) == \"0\" ] && cd /usr/local/services/rabbitmq_server3-1.0/sbin && ./rabbitmq-server -detached > ./temp.log 2>&1 &")

if __name__ == '__main__':
    main()

