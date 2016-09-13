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
* Ubuntu Vagrant Box File

```
http://www.vagrantbox.es/
http://mirrors.hypo.cn/ubuntu-vagrant
```

## How To Run

**Add Vagrant Box**

```
vagrant box add {name} path/of/box/file
```

**Fill Box Name**

```
Vagrant.configure(2) do |config|
  config.vm.box = "{name}" # your box name
```

**Commands**

```
// start
vagrant up

// stop
vagrant halt
```
