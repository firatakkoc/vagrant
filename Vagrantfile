# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
       sudo apt-get update -y
       sudo apt-get install python-pip -y
       sudo apt-get install python-dev -y
       sudo pip install virtualenv
       sudo pip install gunicorn
       sudo pip install flask
  
  SHELL
  end
