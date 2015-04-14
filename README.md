#WebServer for DIGIO

This is a prepared Vagrant box for -Web Developers in DIGIO Soluciones Digitales

This box is configured with:

* Ubuntu 12.04 with specials PPA's for PHP, Apache and NodeJS
* Webmin
* Nginx
* Apache 2.4
* PHP 5.5 working as FPM or FastCGI
* NodeJS
* Sphinx
* Redis
* Memcached

###Windows configuration
This box requires that you copy the Vagrantfile and the box into c:/Vagrant/boxes/

After run inside the box folder the commandline
> vagrant init
> vagrant plugin install vagrant-winnfsd
> start.cmd

### MacOSX and Linux
This box is configured with nfs share, please check the folders to share

### General SO steps
Run first the initial provisioning with the vagrant machine started

> vagrant provision

