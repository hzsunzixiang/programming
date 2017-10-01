#! /bin/sh

awk 'BEGIN { print "Analysis of `foo'" }
/foo/ { ++foobar }
END { print "`foo' appears " foobar " times." }' BBS-list



