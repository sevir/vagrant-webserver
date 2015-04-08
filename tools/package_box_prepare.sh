#!/bin/bash
sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /vagrant/tools/insecure_private_key.pub > ~/.ssh/authorized_keys
cat /dev/null > ~/.bash_history && history -c
sudo cat /dev/null > ~/.bash_history && sudo history -c
exit
