#! /bin/sh

awk '$1 == "on", $1 == "off" {print } ' onoff



