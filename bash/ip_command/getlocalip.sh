ip -o addr show up primary scope global |grep -w inet  |awk '{print $4}' |awk -F/ '{print $1}' |head -n1

