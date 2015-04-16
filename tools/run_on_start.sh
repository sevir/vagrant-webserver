#!/bin/bash
echo "Running run_on_start.sh script..."
sudo service apache2 restart
echo "Changing default dns..."
sudo sed -i 's/nameserver.*/nameserver 8.8.8.8/' /etc/resolv.conf
echo "Restarting postfix..."
sudo service postfix restart
