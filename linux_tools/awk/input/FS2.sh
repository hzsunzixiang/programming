#! /bin/sh
awk '{ $3 = $2 - 10; print $2, $3 }' inventory-shipped
