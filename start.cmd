@echo off
vagrant.exe up
echo .
echo Enter to the vagrant box using ssh with this two alternatives:
echo 1. $ vagrant ssh
echo 2. $ ssh vagrant@localhost -p 2222 (password 'vagrant')
echo Press key to stop the vagrant box...
echo .
pause
vagrant.exe halt