https://wiki.openssl.org/index.php/Command_Line_Elliptic_Curve_Operations


Or to convert from a traditional EC format to an encrypted PKCS8 format use:

openssl pkcs8 -topk8 -in tradfile.pem -out p8file.pem
Or to a non-encrypted PKCS8 format use:

openssl pkcs8 -topk8 -nocrypt -in tradfile.pem -out p8file.pem
