# -*- coding: utf-8 -*-
import codecs
import hashlib 


#https://www.blockchain.com/en/btc/block/0000000027f421e4a286d0503bb01190d85548c81df54323db696588770415c6
# 以这个block为例 Block #45200

# 计算hash 有个逆转的过程，要先逆转再计算 再逆转
#switch the endianness of a given string

def revEndian(string):
    return ''.join(reversed([string[i:i+2] for i in range(0, len(string), 2)]))

#find the double sha256 hash for a given hex string
def doubleSha256(hex): 
    bin = codecs.decode(hex, 'hex')
    hash = hashlib.sha256(bin).digest()
    hash2 = hashlib.sha256(hash).digest()
    return revEndian((hash2.encode("hex")))

#https://www.blockchain.com/en/btc/block/0000000027f421e4a286d0503bb01190d85548c81df54323db696588770415c6
def block45200():
    tx1='3d07878f4dfd1c1a29c000dea54e3172fd5949a2f775801dc5dadc88d0b3d48e'
    tx2='5f94ff0a3498c2e403ff895d03b8cb73844bf5833b2fe5ffacfb6c974df7ac27'
    
    tx1=revEndian(tx1)
    tx2=revEndian(tx2)
    print "tx1", tx1
    print "tx2", tx2
    merkleroot=tx1+tx2
    print "merkleroot:", merkleroot
    return doubleSha256(merkleroot)

# 逆转
def merkle_merge_rev(tx1, tx2):
    tx1=revEndian(tx1)
    tx2=revEndian(tx2)
    print "tx1", tx1
    print "tx2", tx2
    tx1_2=tx1+tx2
    print "tx1_2:",tx1_2 
    return doubleSha256(tx1_2)

# https://www.blockchain.com/en/btc/block/00000000000000001e8d6829a8a21adc5d38d0a473b144b6765798e61f98bd1d
def block125552():
    tx1='51d37bdd871c9e1f4d5541be67a6ab625e32028744d7d4609d0c37747b40cd2d'
    tx2='60c25dda8d41f8d3d7d5c6249e2ea1b05a25bf7ae2ad6d904b512b31f997e1a1'
    tx3='01f314cdd8566d3e5dbdd97de2d9fbfbfd6873e916a00d48758282cbb81a45b9'
    tx4='b519286a1040da6ad83c783eb2872659eaf57b1bec088e614776ffe7dc8f6d01'
     
    txhash1_2=merkle_merge_rev(tx1, tx2)
    txhash3_4=merkle_merge_rev(tx3, tx4)
    root = merkle_merge_rev(txhash1_2, txhash3_4)
    return root


#https://bitcoinchain.com/block_explorer/block/528767/
def block528767():
    tx1='189df8d1624cfa599a03cde6fbc3d448138109e8e2771f31598f2a67cdd69c63'
    tx2='0b6969f0532acd2c0b6edf8ceba0cda4263e34bb74e126fa38ca0f743990d3b5'
    tx3='0ea6a8fe5d804a956e375e2e99a5b5efcbf631e74ccfc5f7893b6cfc78bffb05'
    tx4='52a03eec3de1b303d7553c28a9cea01c3b24d500e88f60ef6d0331fe31c2f61a'
    tx5='b5f2f3cde5a0ec6ee9ee7301b5aceef8d6fc34df6d9bdcde413c6a54641fd853'
    tx6=tx5
     
    txhash1_2=merkle_merge_rev(tx1, tx2)
    txhash3_4=merkle_merge_rev(tx3, tx4)
    txhash5_6=merkle_merge_rev(tx5, tx6)
    txhash7_8=txhash5_6
    txhash1_2_3_4= merkle_merge_rev(txhash1_2, txhash3_4)
    txhash5_6_7_8= merkle_merge_rev(txhash5_6, txhash7_8)
    root= merkle_merge_rev(txhash1_2_3_4, txhash5_6_7_8)
    return root

#print "hash",  block45200()
#print "hash",  block125552()
# 完美搞定
print "hash",  block528767()
# 614773bc5203a3a9b562d091b067e393b0fb29b47a956ec0c9b751bf1943712a



