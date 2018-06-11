
# https://www.blockchain.com/en/btc/tx/3f285f083de7c0acabd9f106a43ec42687ab0bebe2e6f0d529db696794540fea

. bitcoin-bash-tools/bitcoin.sh
#privateKey = keyUtils.wifToPrivateKey("5HusYj2b2x4nroApgfvaSfKYZhRbKFH41bVyPooymbC6KfgSXdD") #1MMMM

#privateKey in: 0CAECF01D74102A28AED6A64DCF1CF7B0E41C4DD6C62F70F46FEBDC32514F0BD
#WIF to private key
#
#1 - Take a Wallet Import Format string
#
base58=5HusYj2b2x4nroApgfvaSfKYZhRbKFH41bVyPooymbC6KfgSXdD
#
#2 - Convert it to a byte string using Base58Check encoding
#

decodeBase58 $base58
echo
#800CAECF01D74102A28AED6A64DCF1CF7B0E41C4DD6C62F70F46FEBDC32514F0BDAB318784

#
#3 - Drop the last 4 checksum bytes from the byte string
#
# 800CAECF01D74102A28AED6A64DCF1CF7B0E41C4DD6C62F70F46FEBDC32514F0BD
#
#4 - Drop the first byte (it should be 0x80). If the private key corresponded to a compressed public key, also drop the last byte (it should be 0x01). If it corresponded to a compressed public key, the WIF string will have started with K or L instead of 5 (or c instead of 9 on testnet). This is the private key.
#
# 0CAECF01D74102A28AED6A64DCF1CF7B0E41C4DD6C62F70F46FEBDC32514F0BD
#
#WIF checksum checking
#
#1 - Take the Wallet Import Format string
#
#  5HusYj2b2x4nroApgfvaSfKYZhRbKFH41bVyPooymbC6KfgSXdD 
#
#2 - Convert it to a byte string using Base58Check encoding
#
#   800CAECF01D74102A28AED6A64DCF1CF7B0E41C4DD6C62F70F46FEBDC32514F0BDAB318784
#
#3 - Drop the last 4 checksum bytes from the byte string
#
TMP=800CAECF01D74102A28AED6A64DCF1CF7B0E41C4DD6C62F70F46FEBDC32514F0BD
#
#3 - Perform SHA-256 hash on the shortened string
#
printf $TMP|xxd -r -p |sha256sum -b|xxd -r -p |sha256sum -b
#
#4 - Perform SHA-256 hash on result of SHA-256 hash
#
#    AB318784DA92DDABC6A29950CE5DD6F88630B896AC47C625101C42837513CBB3
#
#5 - Take the first 4 bytes of the second SHA-256 hash, this is the checksum
#
#    AB318784
#
#6 - Make sure it is the same, as the last 4 bytes from point 2
#
#    AB318784

# #800CAECF01D74102A28AED6A64DCF1CF7B0E41C4DD6C62F70F46FEBDC32514F0BDAB318784
#
#7 - If they are, and the byte string from point 2 starts with 0x80 (0xef for testnet addresses), then there is no error. 
