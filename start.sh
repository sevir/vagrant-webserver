#!/bin/bash
script="$0"
basename="$(dirname $script)"
vagrant up
echo "Enter to the vagrant box using ssh with this two alternatives:"
echo "1. $ vagrant ssh"
echo "2. $ ssh vagrant@localhost -p 2222 (password 'vagrant')"
echo ""
read -p "Press [Enter] key to stop the vagrant box..."
vagrant halt