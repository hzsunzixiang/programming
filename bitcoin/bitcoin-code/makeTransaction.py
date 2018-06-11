# -*- coding: utf-8 -*-
import utils
import keyUtils
import txnUtils

# https://www.blockchain.com/en/btc/tx/3f285f083de7c0acabd9f106a43ec42687ab0bebe2e6f0d529db696794540fea
privateKey = keyUtils.wifToPrivateKey("5HusYj2b2x4nroApgfvaSfKYZhRbKFH41bVyPooymbC6KfgSXdD") #1MMMM

print "privateKey in:", privateKey
print "pubkeyhash in:", keyUtils.addrHashToScriptPubKey("1MMMMSUb1piy2ufrSguNUdFmAcvqrQF8M5")
print "pubkeyhash out:", keyUtils.addrHashToScriptPubKey("1KKKK6N21XKo48zWKuQKXdvSsCf95ibHFa")
signed_txn = txnUtils.makeSignedTransaction(privateKey,
        "81b4c832d70cb56ff957589752eb4125a4cab78a25a8fc52d6a09e5bd4404d48", # output (prev) transaction hash
        0, # sourceIndex
        keyUtils.addrHashToScriptPubKey("1MMMMSUb1piy2ufrSguNUdFmAcvqrQF8M5"),
        [[91234, #satoshis
        keyUtils.addrHashToScriptPubKey("1KKKK6N21XKo48zWKuQKXdvSsCf95ibHFa")]]
        )
    
#print "signed_txn:%s"%(signed_txn)
txnUtils.verifyTxnSignature(signed_txn)
print 'SIGNED TXN', signed_txn
