#! /bin/sh
awk 'BEGIN { OFS = ";"; ORS = "\n\n" }
    { print $1, $2 }' BBS-list





