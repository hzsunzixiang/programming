#include <stdio.h>
#include <string.h>
#include <openssl/hmac.h>
 
//begin in sign........ secretKey:QCodRHUFo6VF4Pp7RIRLif8FTFkcZDrf, signStr:POSTplatform.yunapi3.m14dlv330.tcecqpoc.fsphere.cn/?Action=DescribeDBPassword&Nonce=8571928483222908556&Region=hongkong&RequestClient=SDK_PYTHON_3.0.59&SecretId=AKIDZGr6YKYOhd7G4HlfQFZCveSKRKmfVGtf&SignatureMethod=HmacSHA256&Timestamp=1563006503&UID=demo@192.168.1.10:3306&Version=2019-03-14
//                      hashed result:7c29aa1d8c4215ccd5c1c998395d6e30cc0ada1955f9a68323271121941b34cc ........

//7c29aa1d8c4215ccd5c1c998395d6e30cc0ada1955f9a68323271121941b34cc 
// g++ main.cpp -o sample1 -lcrypto
//
int main() {
    // The secret key for hashing
    const char key[] = "QCodRHUFo6VF4Pp7RIRLif8FTFkcZDrf";
 
    // The data that we're going to hash
    char data[] = "POSTplatform.yunapi3.m14dlv330.tcecqpoc.fsphere.cn/?Action=DescribeDBPassword&Nonce=8571928483222908556&Region=hongkong&RequestClient=SDK_PYTHON_3.0.59&SecretId=AKIDZGr6YKYOhd7G4HlfQFZCveSKRKmfVGtf&SignatureMethod=HmacSHA256&Timestamp=1563006503&UID=demo@192.168.1.10:3306&Version=2019-03-14";
    
    // Be careful of the length of string with the choosen hash engine. SHA1 needed 20 characters.
    // Change the length accordingly with your choosen hash engine.     
    unsigned char* result;
    unsigned int len = EVP_MAX_MD_SIZE;
 
    result = (unsigned char*)malloc(sizeof(char) * len);

#if OPENSSL_VERSION_NUMBER < 0x10100000L
	const EVP_MD * engine = NULL;
	engine = EVP_sha256();

	HMAC_CTX ctx;
	HMAC_CTX_init(&ctx);
    HMAC_Init_ex(&ctx, key, strlen(key), engine, NULL);
    HMAC_Update(&ctx, (unsigned char*)&data, strlen(data));
    HMAC_Final(&ctx, result, &len);
    HMAC_CTX_cleanup(&ctx);
#else
	const EVP_MD * engine = NULL;
	engine = EVP_sha256();

    HMAC_CTX *ctx = HMAC_CTX_new();
    // Using sha1 hash engine here.
    // You may use other hash engines. e.g EVP_md5(), EVP_sha224, EVP_sha512, etc
    HMAC_Init_ex(ctx, key, strlen(key), engine, NULL);
    HMAC_Update(ctx, (unsigned char*)&data, strlen(data));
    HMAC_Final(ctx, result, &len);
    HMAC_CTX_free(ctx);


#endif
 
    printf("HMAC digest: ");
 
    for (int i = 0; i <= (int)len; i++)
        printf("%02x", (unsigned int)result[i]);
 
    printf("\n");
 
    free(result);
 
    return 0;
}
