#! /bin/sh
echo ' a b c d' | awk '{ print; $2 = $2; print }'
