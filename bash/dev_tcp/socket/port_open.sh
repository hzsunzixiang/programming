#!/bin/bash 


# find out if TCP port 22 open or not
(echo >/dev/tcp/localhost/22) &>/dev/null && echo "TCP port 22 open" || echo "TCP port 22 close"
#(echo >/dev/tcp/localhost/22) 
#You can use bash loop and find out open ports with the snippets:


