@echo off
%~d0
cd %~p0
bash vagrant up
bash vagrant ssh
bash vagrant suspend