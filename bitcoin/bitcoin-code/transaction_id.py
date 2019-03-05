import codecs
import hashlib 

#https://bitcoin.stackexchange.com/questions/2177/how-to-calculate-a-hash-of-a-tx
#switch the endianness of a given string
def revEndian(string):
    return ''.join(reversed([string[i:i+2] for i in range(0, len(string), 2)]))

##convert a bytebuffer into a string
#def hashStr(bytebuffer):
#    return str(codecs.encode(bytebuffer, 'hex'))[2:-1]

#find the double sha256 hash for a given hex string
def doubleSha256(hex): 
    bin = codecs.decode(hex, 'hex')
    hash = hashlib.sha256(bin).digest()
    hash2 = hashlib.sha256(hash).digest()
    #print "hash2:", hash2.encode("hex")
    #print "hashStr:", hashStr(hash2).encode("hex")
    #return revEndian(hashStr(hash2))
    return revEndian((hash2.encode("hex")))

transaction="0100000001484d40d45b9ea0d652fca8258ab7caa42541eb52975857f96fb50cd732c8b481000000008a47304402202cb265bf10707bf49346c3515dd3d16fc454618c58ec0a0ff448a676c54ff71302206c6624d762a1fcef4618284ead8f08678ac05b13c84235f1654e6ad168233e8201410414e301b2328f17442c0b8310d787bf3d8a404cfbd0704f135b6ad4b2d3ee751310f981926e53a6e8c39bd7d3fefd576c543cce493cbac06388f2651d1aacbfcdffffffff0162640100000000001976a914c8e90996c7c6080ee06284600c684ed904d14c5c88ac00000000"


print "hash", doubleSha256(transaction)
