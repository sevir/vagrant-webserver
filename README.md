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

### SSH access
Default credentials for SSH access are `vagrant` as user and `vagrant` as password.

In order to allow unatended SSH access for vagrant scripts, you need to set up the Vagrantfile to use an specific ssh key.

1. Modify Vagrantfile to use a key stored in a file including the following line
`config.ssh.private_key_path = "tools/vagrant"`
2. If you don't have one, create your key own key pair with `ssh-keygen -t rsa`
Copy them to the tools directory with the names `vagrant` and `vagrant.pub`.
3. Install them in the machine (run it first, with `vagrant up`)
`ssh-copy-id -i tools/vagrant.pub vagrant@localhost -p 2222`

Now you should have unatended access via ssh. To test it, run `vagrant ssh`. If you have any problems, check your access with `ssh -i tools/vagrant vagrant@localhost -p 2222`.
>>>>>>> 59e5acb7aee6544eb6f3eef14c0b514b88584c4c
