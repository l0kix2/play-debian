play-debian
===========

Some debian packages building notes.


About vagrant
=============
Docs http://docs.vagrantup.com/v2/getting-started/index.html  
Vagrantfile created by command  
```
vagrant init precise32 http://files.vagrantup.com/precise32.box
```
and slightly modified.

`up` creates and configures guest machines according to Vagrantfile.
`ssh` will SSH into a running Vagrant machine.

```
vagrant up
vagrant ssh
vagrant reload --provision

vagrant@precise32:~$ cp -r /vagrant/examples/ ~/play-debian && cd play-debian
```
