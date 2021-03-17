# -*- coding: utf-8 -*-

#ENV_TCE = True

env_conf = {
    "vstation": {
        "version": "1.0",
        "url": "http://10.190.52.54/vstation/cgi",
        "operator": "des",
        "requestKey": "con",
        "requestModule": "qcloud",
        "timeout": 300,
        "outlog": True
    },

    "vnc_proxy": {
        "web": None,
        # "/data/release/noVNC_dev/web", # or None
        "target-config": "/data/release/noVNC_dev/test_token",
        # None,
        "ssl-only": False,
        "key": None,
        # "/data/release/noVNC_dev/perm/server.pem",
        "cert": None,
        # "/data/release/noVNC_dev/perm/server.pem",
        "daemon": True,
        "port": 26789,  # must be int
        "log-dir": "/data/log/vstation"
    }
}

RATE_LIMIT_CFG = {
    'visit_limit': 100,
    'visit_interval': 60,  # 60s 内可以请求100次
}

MEMCACHE_CFG = {
    'host': "127.0.0.1",
    'port': "11211"
}

REDIS_CFG = {
    'host': "127.0.0.1",
    'port': "69",
    'user': "hello",
    'pwd': "pass"

}



