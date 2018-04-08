       -selfsign
           indicates the issued certificates are to be signed with the key the certificate requests were signed with (given
           with -keyfile).  Certificate requests signed with a different key are ignored.  If -spkac, -ss_cert or -gencrl
           are given, -selfsign is ignored.

           A consequence of using -selfsign is that the self-signed certificate appears among the entries in the certificate
           database (see the configuration option database), and uses the same serial number counter as all other
           certificates sign with the self-signed certificate.

