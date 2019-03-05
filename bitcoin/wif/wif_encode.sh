#https://en.bitcoin.it/wiki/Wallet_import_format
#Private key to WIF
#
#1 - Take a private key
#
# EA628AE24B0A6852FC55F8A40BF07FA9A9E3BE78D76359671F2C4AA2E695CA20 
#
private= "EA628AE24B0A6852FC55F8A40BF07FA9A9E3BE78D76359671F2C4AA2E695CA20"

#2 - Add a 0x80 byte in front of it for mainnet addresses or 0xef for testnet addresses. Also add a 0x01 byte at the end if the private key will correspond to a compressed public key
#
#   
private_prefix="EFEA628AE24B0A6852FC55F8A40BF07FA9A9E3BE78D76359671F2C4AA2E695CA2001"
#
#3 - Perform SHA-256 hash on the extended key
#
printf $private_prefix|xxd -r -p |sha256sum -b
#
#4 - Perform SHA-256 hash on result of SHA-256 hash
#
printf $private_prefix|xxd -r -p |sha256sum -b|xxd -r -p |sha256sum -b

# 93EA269727B9B56C50DC168E3AA87B26349E32473910DA5EAC474D4DF5D85120
#
#5 - Take the first 4 bytes of the second SHA-256 hash, this is the checksum
#
#  93EA2697 
#
#6 - Add the 4 checksum bytes from point 5 at the end of the extended key from point 2
#
checksum=EFEA628AE24B0A6852FC55F8A40BF07FA9A9E3BE78D76359671F2C4AA2E695CA200193EA2697
#
#7 - Convert the result from a byte string into a base58 string using Base58Check encoding. This is the Wallet Import Format
#

. bitcoin-bash-tools/bitcoin.sh
encodeBase58 $checksum
echo
#
# cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg

