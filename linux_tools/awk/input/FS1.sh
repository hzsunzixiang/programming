#! /bin/sh
cat /etc/passwd| awk '{ FS = ":" ; print $1 }'
