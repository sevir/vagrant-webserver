@echo off
c:
cd \Vagrant\boxes\webserver
bash vagrant up
bash vagrant ssh
bash vagrant suspend