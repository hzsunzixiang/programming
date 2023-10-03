sudo cp Hello_FOSSLinux.sh /usr/local/bin/Hello_FOSSLinux.sh
sudo cp FOSSLinux.service /etc/systemd/system/FOSSLinux.service

sudo systemctl stop FOSSLinux.service
sudo systemctl daemon-reload
sudo systemctl start FOSSLinux.service 
