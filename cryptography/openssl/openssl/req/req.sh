 openssl req -new -sha256 -newkey rsa:2048 -nodes -keyout dev.deliciousbrains.com.key -x509 -days 365 -out dev.deliciousbrains.com.crt
 openssl  x509 -text -in dev.deliciousbrains.com.crt  -noout



openssl genrsa -out key.pem 2048
openssl req -new -key key.pem -out req.pem
