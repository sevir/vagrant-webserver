#!/bin/bash
echo "apt-get clean..."
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove
echo "zeroed freespace..."
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -rf /EMPTY
echo "removing logs..."
sudo find /var/log -type f -name "*.gz" -delete
sudo find /var/log -type f -name "*.log" -delete
echo "copying ssh keys"
cat /vagrant/tools/ssh-keys/insecure_private_key.pub > ~/.ssh/authorized_keys
cat /vagrant/tools/ssh-keys/vagrant.pub >> ~/.ssh/authorized_keys
echo "cleaning history"
cat /dev/null > ~/.bash_history && history -c
sudo cat /dev/null > /root/.bash_history && sudo history -c
exit