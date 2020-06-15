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

  # Create a private network, which allows host-only access to the machine
  config.vm.network "private_network", type: "dhcp"

  
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network", type: "dhcp"


  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  
  # Enable provisioning with a shell script.
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    sudo apt -y install git
    git clone https://github.com/firatakkoc/vagrant.git
    sudo apt -y install build-essential libpq-dev libssl-dev openssl libffi-dev zlib1g-dev
    sudo apt -y install python3-pip python3-dev python3-venv
    sudo apt -y install nginx
    echo '############################'
    echo 'UBUNTU GLOBAL SETUP COMPLETE'
    echo '############################'
    sleep 2
    # ubuntu user setup
    echo '#################'
    echo 'UBUNTU USER SETUP'
    echo '#################'
    
    sleep 2

    sudo usermod -aG root vagrant
    sudo usermod -aG sudo vagrant
    umask 002
    pip3 install virtualenvwrapper
    echo '# default location of virtual environment directories' >> ~/.bashrc
    echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc
    echo '# default python version to use with virtualenv' >> ~/.bashrc
    echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' >> ~/.bashrc
    echo "export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '" >> ~/.bashrc
    echo 'source `which virtualenvwrapper.sh`' >> ~/.bashrc
    source ~/.bashrc
    echo '##########################'
    echo 'UBUNTU USER SETUP COMPLETE'
    echo '##########################'
    sleep 2

    # app dependencies setup
    echo '######################'
    echo 'APP DEPENDENCIES SETUP'
    sudo apt -y install python-virtualenv
    mkdir /home/vagrant/flask_apps
    cd /home/vagrant/flask_apps
    virtualenv app01_env
    source app01_env/bin/activate
    pip install gunicorn flask
    cp /home/vagrant/vagrant/flask_app/app01.py /home/vagrant/flask_apps/app01_env/
    cp /home/vagrant/vagrant/flask_app/wsgi.py /home/vagrant/flask_apps/app01_env/
    cp /home/vagrant/vagrant/gunicorn/gunicorn_config.py /home/vagrant/flask_apps/app01_env/
    deactivate
    cd /app01_env
    echo '###############################'
    echo 'APP DEPENDENCIES SETUP COMPLETE'
    echo '###############################'
    sleep 2


    echo '#############'
    echo 'SYSTEMD SETUP'
    echo '#############'
    sleep 2
    sudo cp /home/vagrant/vagrant/systemd/app01.service  /etc/systemd/system/
    sudo systemctl start app01
    sudo systemctl enable app01.service
    echo '######################'
    echo 'SYSTEMD SETUP COMPLETE'
    echo '######################'
    sleep 2

    echo '###########'
    echo 'NGINX SETUP'
    echo '###########'
    sleep 2
    sudo cp /home/vagrant/vagrant/nginx/nginx_app01.conf /etc/nginx/sites-available/
    sudo rm /etc/nginx/sites-enabled/default
    sudo ln -s /etc/nginx/sites-available/nginx_app01.conf /etc/nginx/sites-enabled
    sudo service nginx start
    echo '####################'
    echo 'NGINX SETUP COMPLETE'
    echo '####################'
    sleep 2

    sudo nginx -t
    sudo service nginx restart

    echo '###############################################'
    echo 'SCALABLE-UBUNTU-FLASK-GUNICORN-NGINX SUCCESSFUL'
    echo '###############################################'

   SHELL
  
   config.vm.provision "shell", inline: <<-SHELL
    sudo chown vagrant flask_apps/*
    sudo chown vagrant flask_apps/app01_env/*
    sudo chown vagrant vagrant/*
    sudo chown vagrant vagrant/flask_app/*
    sudo chown vagrant vagrant/gunicorn/*
    sudo chown vagrant vagrant/nginx/*
    sudo chown vagrant vagrant/systemd/*
   
   SHELL
   


  config.vm.provision "shell", inline: "bash vagrant/bootstrap.sh",
    run: "always"
    
  


  config.push.define "local-exec" do |push|
   push.inline = <<-SCRIPT
   vagrant ssh Flask -c 'sudo pkill python'
   scp -P 2222 /Users/firat.akkoc/Documents/git_repo/vagrant/flask_app/app01.py vagrant@127.0.0.1:/home/vagrant/flask_apps/app01_env/
   vagrant reload
  
   SCRIPT
  
    end


 
 end 