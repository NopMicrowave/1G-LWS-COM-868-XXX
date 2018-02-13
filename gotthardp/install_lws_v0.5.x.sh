#!/bin/bash

echo "Install LoRaWAN Server"

# Stop on the first sign of trouble
set -e

# Create the required lorawan-server directory for Mnesia database and log files
LWS_DIR="/home/ogate/lorawan-server"
if [ ! -d "$LWS_DIR" ]
then
mkdir $LWS_DIR
chown ogate:ogate $LWS_DIR
chmod a+rwx $LWS_DIR
fi

# Download and install debian package 
wget https://github.com/gotthardp/lorawan-server/releases/download/v0.5.0/lorawan-server_0.5.0_all.deb
dpkg -i lorawan-server_0.5.0_all.deb

echo "Installation completed."

# Start lorawan server as a service

#sed -i -e "s/Environment=LORAWAN_HOME=\/var\/lib\/lorawan-server/Environment=LORAWAN_HOME=\/home\/ogate\/lorawan-server/g" /lib/systemd/system/lorawan-server.service
systemctl enable lorawan-server.service

#echo "The system will reboot in 5 seconds..."
#sleep 5
#shutdown -r now
