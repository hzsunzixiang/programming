# NOTE(skipzhang)
# 修改后的代码，从30行开始引用文件锁，保证进程间的原子性。
# 另外业务协程调用 logger.log 加进写入队列之后立刻返回，实际由一个专门的协程专门文件，这样磁盘高IO对业务方0影响。

# TODO(skipzhang)（设定队列内存上限，防止堆积即可。）

import time
import os
import fcntl
import struct
import sys
import logging
import gevent
import logging.handlers
from gevent.queue import Queue,Empty
from logging.handlers import TimedRotatingFileHandler
from framework.static import get_current_request_id
from framework import conf
from gevent.fileobject import FileObjectPosix

messages = Queue(conf['common']['debug']['limit'])

class MultiProcessTimedRotatingFileHandler(TimedRotatingFileHandler):

    _stream_lock = None

    def doRollover(self):
        """
        do a rollover; in this case, a date/time stamp is appended to the filename
        when the rollover happens.  However, you want the file to be named for the
        start of the interval, not the current time.  If there is a backup count,
        then we have to get a list of matching filenames, sort them and remove
        the one with the oldest suffix.
        """
        if self.stream:
            self.stream.close()
            self.stream = None
        # get the time that this sequence started at and make it a TimeTuple
        currentTime = int(time.time())
        dstNow = time.localtime(currentTime)[-1]
        t = self.rolloverAt - self.interval
        if self.utc:
            timeTuple = time.gmtime(t)
        else:
            timeTuple = time.localtime(t)
            dstThen = timeTuple[-1]
            if dstNow != dstThen:
                if dstNow:
                    addend = 3600
                else:
                    addend = -3600
                timeTuple = time.localtime(t + addend)
        dfn = self.baseFilename + '.' + time.strftime(self.suffix, timeTuple)

        # 加锁保证rename的进程安全
        if not os.path.exists(dfn) and os.path.exists(self.baseFilename):
            fcntl.lockf(self.stream_lock, fcntl.LOCK_EX)
            try:
                if not os.path.exists(dfn) and os.path.exists(self.baseFilename):
                    os.rename(self.baseFilename, dfn)
            finally:
                fcntl.lockf(self.stream_lock, fcntl.LOCK_UN)

        # 加锁保证删除文件的进程安全
        if self.backupCount > 0:
            if self.getFilesToDelete():
                fcntl.lockf(self.stream_lock, fcntl.LOCK_EX)
                try:
                    files_to_delete = self.getFilesToDelete()
                    if files_to_delete:
                        for s in files_to_delete:
                            os.remove(s)
                finally:
                    fcntl.lockf(self.stream_lock, fcntl.LOCK_UN)

        if not self.delay:
            # _open默认是以‘a'的方式打开，是进程安全的
            self.stream = self._open()
            self.stream = FileObjectPosix(self.stream, 'wUb')

        newRolloverAt = self.computeRollover(currentTime)
        while newRolloverAt <= currentTime:
            newRolloverAt = newRolloverAt + self.interval
        # If DST changes and midnight or weekly rollover, adjust for this.
        if (self.when == 'MIDNIGHT' or self.when.startswith('W')) and not self.utc:
            dstAtRollover = time.localtime(newRolloverAt)[-1]
            if dstNow != dstAtRollover:
                if not dstNow:  # DST kicks in before next rollover, so we need to deduct an hour
                    addend = -3600
                else:           # DST bows out before next rollover, so we need to add an hour
                    addend = 3600
                newRolloverAt += addend
        self.rolloverAt = newRolloverAt

    @property
    def stream_lock(self):
        if not self._stream_lock:
            self._stream_lock = self._openLockFile()
        return self._stream_lock

    def _getLockFile(self):
        # Use 'file.lock' and not 'file.log.lock' (Only handles the normal "*.log" case.)
        if self.baseFilename.endswith('.log'):
            lock_file = self.baseFilename[:-4]
        else:
            lock_file = self.baseFilename
        lock_file += '.lock'
        return lock_file

    def _openLockFile(self):
        lock_file = self._getLockFile()
        return open(lock_file, 'a')


def _setup_logging_from_conf(name, level=6, logdir='tmp'):
    level_map = {
        0: logging.CRITICAL,
        1: logging.CRITICAL,
        2: logging.CRITICAL,
        3: logging.ERROR,
        4: logging.WARNING,
        5: logging.WARNING,
        6: logging.INFO,
        7: logging.DEBUG
    }
    if not os.access(logdir, os.F_OK):
        try:
            os.umask(0)
            os.mkdir(logdir)
        except Exception:
            logdir = 'tmp'
    LOG = _logger = logging.getLogger()

    _f = '[%(asctime)s] %(message)s'
    formatter = logging.Formatter(_f)
    _log_file = logdir + '/%s.log' % (name,)
    _logger.setLevel(level_map.get(level, 0))
    timelog = MultiProcessTimedRotatingFileHandler(_log_file, 'h', 1, 0)
    #timelog.stream = FileObjectPosix(timelog.stream, 'wUb')
    timelog.setFormatter(formatter)

    _logger.addHandler(timelog)

    if os.environ.get('API_ENABLE_CONSOLE_LOG'):
        console_handler = logging.StreamHandler()
        console_handler.setFormatter(formatter)
        _logger.addHandler(console_handler)

    return LOG


LOG = _setup_logging_from_conf(conf['common']['debug']['filename'], level=conf['common']["debug"]["level"],
                               logdir=conf['common']["debug"]["path"])


def render_line(msg):
    f = sys._getframe().f_back.f_back
    caller = f"{os.path.basename(f.f_code.co_filename)} {f.f_code.co_name} {f.f_lineno}"
    rid = get_current_request_id()
    prefix = f"[{rid}][{caller}]"
    msg = f"{prefix}{msg}"
    msg = msg.replace("\n", f'\n{prefix}')
    return msg

def debug(msg, *l, **k):
    messages.put_nowait((LOG.debug, render_line(msg), l, k))


def info(msg, *l, **k):
    messages.put_nowait((LOG.info, render_line(msg), l, k))


def traceback(info_type, **info_dict):
    payload = ", ".join([f"{k}:{v}" for k, v in info_dict.items()])
    header = f'[VVV][{info_type}]'
    data = f'{header}{payload}'
    info(data)


def warning(msg, *l, **k):
    messages.put_nowait((LOG.warning, render_line(msg), l, k))


def error(msg, *l, **k):
    messages.put_nowait((LOG.error, render_line(msg), l, k))


def write_worker(logger):
    while True:
        try:
            func, msg, l, k = messages.get(timeout=720)
            func(msg)
        except Empty:
            logger.info("Heartbeat")
        gevent.sleep(0)

gevent.spawn(write_worker, LOG)

