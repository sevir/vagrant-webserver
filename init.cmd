@echo off
%~d0
cd %~p0
bash vagrant init digio/webdev
echo Vagrant Webserver initialized, please run start.cmd for download and running the box
