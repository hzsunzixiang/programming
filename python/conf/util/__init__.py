# -*- coding: utf-8 -*-

env_tce = False
try:
    from config import ENV_TCE
    print("env_tce:%s"%(ENV_TCE,))
    env_tce = ENV_TCE
except:
    pass
