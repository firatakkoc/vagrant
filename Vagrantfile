# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Flask
  config.vm.network "127.0.0.1", guest: 5000, host: 5000

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  # Provision python development environment
  config.vm.provision "shell", inline: <<-SHELL
    export HOME=/home/vagrant
    sudo apt-get update
    sudo apt-get install -yq \
      ntp \
      git \
      python-dev \
      python-virtualenv \
      postgresql \
      libpq-dev
    su vagrant -c 'cd /vagrant &&
                   make venv/setup &&
                   source venv/bin/activate &&
                   make pip/update &&
                   make db/create'
  SHELL
end
