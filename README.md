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


### Improve NFS on Windows systems
Ubuntu systems have a built in tool that caches access to NFS disks. As the NFS system for Windows is not a native solution, its performance is not as good as expected. Setting up `cachefilesd` partially solves that. 

```
sudo apt-get install cachefilesd
```

Edit `/etc/default/cachefilesd` and uncomment the line `RUN=yes`.

Then, update your Vagrantfile to add a new mount option, `fsc`, as follows:

```
config.vm.synced_folder "/your/folder", "/vagrant/folder", type: "nfs", mount_options: [..., 'fsc']
```

Reload your vagrant machine. You can check that `cachefilesd` is actually working by browsing the cache directory inside the vagrant machine:

```
cd /var/cache/fscache/
sudo du -sh
```