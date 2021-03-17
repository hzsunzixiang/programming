
import config 
#from config import ENV_TCE
from util import env_tce 

env_tce = False
try:
    #from config import ENV_TCE
    print("env_tce:%s"%(ENV_TCE,))
    env_tce = config.ENV_TCE
except:
    pass

print("env_tce:%s"%(env_tce,))

if env_tce:
    storage = 100 
else:
    storage = 200
print("storage:%s"%(storage,))
        
