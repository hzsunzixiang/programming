#! /bin/sh
echo a b c d | awk '{ OFS = ":"; $2 = "" ; print ; print NF }'
