# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  
    config.vm.box = "bento/ubuntu-18.04"
    config.vm.provider "virtualbox" do |v|
      v.name = "FlaskVM"
     end
    config.vm.define "Flask" do |t|
     end
    #config.vm.provision :shell, path: ""
  
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # config.vm.network "forwarded_port", guest: 80, host: 8080
  
    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine and only allow access
    # via 127.0.0.1 to disable public access
    config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    config.vm.network "forwarded_port", guest: 80, host: 5000, host_ip: "127.0.0.1"
    config.vm.network "forwarded_port", guest: 80, host: 8000, host_ip: "127.0.0.1"
  
    # Create a private network, which allows host-only access to the machine
    #config.vm.network "private_network", type: "dhcp"
  
    
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network", type: "dhcp"
  
  
  
    # Just getting started...
    # Enable provisioning with a shell script.
    config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      sudo apt -y install git
      sudo su -c 'git clone https://github.com/firatakkoc/vagrant.git' -s /bin/sh vagrant
      
  
    SHELL

      # This part: New created regulates the permissions of the files.
    config.vm.provision "shell", inline: "sudo su vagrant -c 'bash vagrant/install.sh' /bin/sh vagrant "

  
     # This provision, every time it VM and run always.
    config.vm.provision "shell", inline: "sudo su -c 'bash vagrant/bootstrap.sh' /bin/sh vagrant  "
      run: "always"

     # This command: Change file and proces kill. 
    config.push.define "local-exec" do |push|
     push.inline = <<-SCRIPT
     vagrant ssh Flask -c 'sudo pkill python'
     scp -P 2222 /Users/firat.akkoc/Documents/git_repo/vagrant/flask_app/app01.py vagrant@127.0.0.1:/home/vagrant/flask_apps/app01_env/
     vagrant reload
    
     SCRIPT
    
      end
  
  
   
   end 