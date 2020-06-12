# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-18.04"


  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
   config.vm.network "private_network", type: "dhcp"


  # Bridged networks make the machine appear as another physical device on
  # your network.
  #config.vm.network "public_network" 

  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end


  # Enable provisioning with a shell script.
  config.vm.provision "shell", inline: <<-SHELL
    git clone https://github.com/firatakkoc/vagrant.git
    cd vagrant/vagrant/setup
    bash setup.sh
  # sudo apt update
  # sudo apt-get install python3-pip python3-dev nginx supervisor -y
  # sudo apt install nginx build-essential supervisor python3-setuptools python3-pip python3-dev python3.4-venv -y

   SHELL
end
