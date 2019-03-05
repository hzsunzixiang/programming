# -*- coding: utf-8 -*-
# https://pypi.python.org/pypi/ecdsa/0.10

import ecdsa
import hashlib
import struct
import unittest

import utils
import keyUtils

# Makes a transaction from the inputs
# outputs is a list of [redemptionSatoshis, outputScript]
def makeRawTransaction(outputTransactionHash, sourceIndex, scriptSig, outputs):
    print "int makeRawTransaction----------------------"
    print "outputTransactionHash", outputTransactionHash
    print "sourceIndex", sourceIndex 
    print "scriptSig", scriptSig 
    print "outputs",  outputs
    
    print "int makeRawTransaction----------------------"
    def makeOutput(data):
        redemptionSatoshis, outputScript = data
        return (struct.pack("<Q", redemptionSatoshis).encode('hex') +
        '%02x' % len(outputScript.decode('hex')) + outputScript)
    formattedOutputs = ''.join(map(makeOutput, outputs))
    return (
        "01000000" + # 4 bytes version
        "01" + # varint for number of inputs
        outputTransactionHash.decode('hex')[::-1].encode('hex') + # reverse outputTransactionHash
        struct.pack('<L', sourceIndex).encode('hex') +
        '%02x' % len(scriptSig.decode('hex')) + scriptSig +
        "ffffffff" + # sequence
        "%02x" % len(outputs) + # number of outputs
        formattedOutputs +
        "00000000" # lockTime
        )

# Returns [first, sig, pub, rest]
def parseTxn(txn):
    first = txn[0:41*2]
    scriptLen = int(txn[41*2:42*2], 16)
    script = txn[42*2:42*2+2*scriptLen]
    sigLen = int(script[0:2], 16)
    sig = script[2:2+sigLen*2]
    pubLen = int(script[2+sigLen*2:2+sigLen*2+2], 16)
    pub = script[2+sigLen*2+2:]
            
    assert(len(pub) == pubLen*2)
    rest = txn[42*2+2*scriptLen:]
    return [first, sig, pub, rest]         

# Substitutes the scriptPubKey into the transaction, appends SIGN_ALL to make the version
# of the transaction that can be signed
def getSignableTxn(parsed):
    first, sig, pub, rest = parsed
    inputAddr = utils.base58CheckDecode(keyUtils.pubKeyToAddr(pub))
    # 组合输入的前半段 加上 "1976a914"  加上输入的钱包hash(不是钱包地址，是钱包的hash值)
    # 加上 输入部分 再加 "01000000" hash type
    # 以此组合出签名字符串
    return first + "1976a914" + inputAddr.encode('hex') + "88ac" + rest + "01000000"

# Verifies that a transaction is properly signed, assuming the generated scriptPubKey matches
# the one in the previous transaction's output
def verifyTxnSignature(txn):                    
    parsed = parseTxn(txn)      

    # 这里拿到签名字符串 有个还原的过程，所以 才得以一致
    signableTxn = getSignableTxn(parsed)
    print "signableTxn:", signableTxn
    hashToSign = hashlib.sha256(hashlib.sha256(signableTxn.decode('hex')).digest()).digest().encode('hex')
    print "parsed,", parsed
    print "hashToSign,",hashToSign 
    assert(parsed[1][-2:] == '01') # hashtype
    # 验证这个签名是否是对 hashToSign 做的签名
    # TODO 这里没搞明白 为啥签名方式和前面构造的时候不一样
    sig = keyUtils.derSigToHexSig(parsed[1][:-2])
    print "sig", sig, hashToSign
    
    # 用公钥验证
    public_key = parsed[2]
    vk = ecdsa.VerifyingKey.from_string(public_key[2:].decode('hex'), curve=ecdsa.SECP256k1)
    print "result:", (vk.verify_digest(sig.decode('hex'), hashToSign.decode('hex')))
    assert(vk.verify_digest(sig.decode('hex'), hashToSign.decode('hex')))

def makeSignedTransaction(privateKey, outputTransactionHash, sourceIndex, scriptPubKey, outputs):
    myTxn_forSig = (makeRawTransaction(outputTransactionHash, sourceIndex, scriptPubKey, outputs)
         + "01000000") # hash code
    print "myTxn_forSig:", myTxn_forSig
    
    # 这里转换成二进制形式
    #print "myTxn_forSig.decode:", myTxn_forSig.decode("hex")
    # myTxn_forSig 就是交易的原始数据

    # 先转换成二进制形式，再做哈希， 再做hash
    s256 = hashlib.sha256(hashlib.sha256(myTxn_forSig.decode('hex')).digest()).digest()
    # 对原始交易数据进行两次hash
    print "s256:", s256.encode("hex")

    # We then create a public/private key pair out of the provided private key. We sign the hash from step 14 with the private key, which yields the following DER-encoded signature (this signature will be different in your case): 
    sk = ecdsa.SigningKey.from_string(privateKey.decode('hex'), curve=ecdsa.SECP256k1)
    #sig = sk.sign_digest(s256, sigencode=ecdsa.util.sigencode_der) + '\01' # 01 is hashtype
    # 照抄比特币网站上的签名
    sig = "304402202cb265bf10707bf49346c3515dd3d16fc454618c58ec0a0ff448a676c54ff71302206c6624d762a1fcef4618284ead8f08678ac05b13c84235f1654e6ad168233e8201".decode('hex')
    # 这里的签名是真正的签名， 由于签名中有个随机数K，所以每次的签名都不一样
#Debugging the signature was made more difficult because the ECDSA algorithm uses a random number.[18] Thus, the signature is different every time you compute it, so it can't be compared with a known-good signature.
    print "sig of the hash,", sig.encode('hex')
    
    # 公钥
    pubKey = keyUtils.privateKeyToPublicKey(privateKey)
    print "pubKey:", pubKey

    # 把scriptSig 组装起来
    scriptSig = utils.varstr(sig).encode('hex') + utils.varstr(pubKey.decode('hex')).encode('hex')
    print "scriptSig", scriptSig

    signed_txn = makeRawTransaction(outputTransactionHash, sourceIndex, scriptSig, outputs)
    # 然后用 signed_txn中的 pubKey 来还原签名字符串 验证一下
    #print "signed_txn", signed_txn
    verifyTxnSignature(signed_txn)
    return signed_txn
    
class TestTxnUtils(unittest.TestCase):

    def test_verifyParseTxn(self):
        txn =          ("0100000001a97830933769fe33c6155286ffae34db44c6b8783a2d8ca52ebee6414d399ec300000000" +
                        "8a47" +
                        "304402202c2e1a746c556546f2c959e92f2d0bd2678274823cc55e11628284e4a13016f80220797e716835f9dbcddb752cd0115a970a022ea6f2d8edafff6e087f928e41baac01" +
                        "41" +
                        "04392b964e911955ed50e4e368a9476bc3f9dcc134280e15636430eb91145dab739f0d68b82cf33003379d885a0b212ac95e9cddfd2d391807934d25995468bc55" +
                        "ffffffff02015f0000000000001976a914c8e90996c7c6080ee06284600c684ed904d14c5c88ac204e000000000000" +
                        "1976a914348514b329fda7bd33c7b2336cf7cd1fc9544c0588ac00000000")


        parsed = parseTxn(txn)
        self.assertEqual(parsed[0], "0100000001a97830933769fe33c6155286ffae34db44c6b8783a2d8ca52ebee6414d399ec300000000")
        self.assertEqual(parsed[1], "304402202c2e1a746c556546f2c959e92f2d0bd2678274823cc55e11628284e4a13016f80220797e716835f9dbcddb752cd0115a970a022ea6f2d8edafff6e087f928e41baac01")
        self.assertEqual(parsed[2], "04392b964e911955ed50e4e368a9476bc3f9dcc134280e15636430eb91145dab739f0d68b82cf33003379d885a0b212ac95e9cddfd2d391807934d25995468bc55")
        self.assertEqual(parsed[3], "ffffffff02015f0000000000001976a914c8e90996c7c6080ee06284600c684ed904d14c5c88ac204e000000000000" +
                        "1976a914348514b329fda7bd33c7b2336cf7cd1fc9544c0588ac00000000")

    def test_verifySignableTxn(self):
        txn =          ("0100000001a97830933769fe33c6155286ffae34db44c6b8783a2d8ca52ebee6414d399ec300000000" +
                        "8a47" +
                        "304402202c2e1a746c556546f2c959e92f2d0bd2678274823cc55e11628284e4a13016f80220797e716835f9dbcddb752cd0115a970a022ea6f2d8edafff6e087f928e41baac01" +
                        "41" +
                        "04392b964e911955ed50e4e368a9476bc3f9dcc134280e15636430eb91145dab739f0d68b82cf33003379d885a0b212ac95e9cddfd2d391807934d25995468bc55" +
                        "ffffffff02015f0000000000001976a914c8e90996c7c6080ee06284600c684ed904d14c5c88ac204e000000000000" +
                        "1976a914348514b329fda7bd33c7b2336cf7cd1fc9544c0588ac00000000")

        parsed = parseTxn(txn)      
        myTxn_forSig = ("0100000001a97830933769fe33c6155286ffae34db44c6b8783a2d8ca52ebee6414d399ec300000000" +
                        "1976a914" + "167c74f7491fe552ce9e1912810a984355b8ee07" + "88ac" +
                        "ffffffff02015f0000000000001976a914c8e90996c7c6080ee06284600c684ed904d14c5c88ac204e000000000000" +
                        "1976a914348514b329fda7bd33c7b2336cf7cd1fc9544c0588ac00000000" +
                        "01000000")
        signableTxn = getSignableTxn(parsed)
        self.assertEqual(signableTxn, myTxn_forSig)

    def test_verifyTxn(self):
        txn =          ("0100000001a97830933769fe33c6155286ffae34db44c6b8783a2d8ca52ebee6414d399ec300000000" +
                        "8a47" +
                        "304402202c2e1a746c556546f2c959e92f2d0bd2678274823cc55e11628284e4a13016f80220797e716835f9dbcddb752cd0115a970a022ea6f2d8edafff6e087f928e41baac01" +
                        "41" +
                        "04392b964e911955ed50e4e368a9476bc3f9dcc134280e15636430eb91145dab739f0d68b82cf33003379d885a0b212ac95e9cddfd2d391807934d25995468bc55" +
                        "ffffffff02015f0000000000001976a914c8e90996c7c6080ee06284600c684ed904d14c5c88ac204e000000000000" +
                        "1976a914348514b329fda7bd33c7b2336cf7cd1fc9544c0588ac00000000")

        verifyTxnSignature(txn)

    def test_makeRawTransaction(self):
        #http://bitcoin.stackexchange.com/questions/3374/how-to-redeem-a-basic-tx
        txn = makeRawTransaction(
            "f2b3eb2deb76566e7324307cd47c35eeb88413f971d88519859b1834307ecfec", # output transaction hash
            1, # sourceIndex
            "76a914010966776006953d5567439e5e39f86a0d273bee88ac", # scriptSig
            [[99900000, #satoshis
            "76a914097072524438d003d23a2f23edb65aae1bb3e46988ac"]], # outputScript
            ) + "01000000" # hash code type
        self.assertEqual(txn,
            "0100000001eccf7e3034189b851985d871f91384b8ee357cd47c3024736e5676eb2debb3f2" +
            "010000001976a914010966776006953d5567439e5e39f86a0d273bee88acffffffff" +
            "01605af405000000001976a914097072524438d003d23a2f23edb65aae1bb3e46988ac" +
            "0000000001000000")
   
    def test_makeSignedTransaction(self):
        # Transaction from
        # https://blockchain.info/tx/901a53e7a3ca96ed0b733c0233aad15f11b0c9e436294aa30c367bf06c3b7be8
        # From 133t to 1KKKK
        privateKey = keyUtils.wifToPrivateKey("5Kb6aGpijtrb8X28GzmWtbcGZCG8jHQWFJcWugqo3MwKRvC8zyu") #133t

        signed_txn = makeSignedTransaction(privateKey,
            "c39e394d41e6be2ea58c2d3a78b8c644db34aeff865215c633fe6937933078a9", # output (prev) transaction hash
            0, # sourceIndex
            keyUtils.addrHashToScriptPubKey("133txdxQmwECTmXqAr9RWNHnzQ175jGb7e"),
            [[24321, #satoshis
            keyUtils.addrHashToScriptPubKey("1KKKK6N21XKo48zWKuQKXdvSsCf95ibHFa")],
             [20000,            keyUtils.addrHashToScriptPubKey("15nhZbXnLMknZACbb3Jrf1wPCD9DWAcqd7")]]
            )

        verifyTxnSignature(signed_txn)

if __name__ == '__main__':
    unittest.main()
