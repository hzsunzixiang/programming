#! /bin/sh
ls -l | awk '$6 == "Mar" { sum += $5 }
END { print sum }'
