# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #config.vbguest.auto_update = false
  config.vm.box = "debian/bullseye64"
  config.vm.network "private_network", ip:"192.168.57.10"
  config.vm.provision "shell", privileged: false, path: "provision.sh"
end