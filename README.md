# Basic Vagrant Template

Quick build a development environment includes web, api and db service.

## Stack

* Express
* Mongoose
* Mongodb
* Nginx
* Vagrant

## Prerequisite

* [Vagrant](https://www.vagrantup.com/)
* [Virtualbox](https://www.virtualbox.org/)
* [ubuntu/trusty64 box](https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box) | [source](http://www.vagrantbox.es/)

## How To Run

**Add Vagrant Box**

```
vagrant box add ubuntu/trusty64 path/of/box/file
```

**Fill Box Name**

```
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64" # your box name
```

**Commands**

```
// start
vagrant up

// stop
vagrant halt
```
