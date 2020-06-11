#!/bin/bash

# ubuntu global setup
echo '#########################'
echo 'UBUNTU GLOBAL SETUP START'
echo '#########################'
sleep 2
sudo apt update
#sudo apt -y upgrade
sudo apt -y install ntpdate
sudo ntpdate pool.ntp.org
sudo apt -y install ntp
sudo apt -y install build-essential libpq-dev libssl-dev openssl libffi-dev zlib1g-dev
sudo apt -y install python3-pip python3-dev python3-venv python3.4-venv 
sudo apt -y install nginx
sudo pip3 install virtualenvwrapper
echo '############################'
echo 'UBUNTU GLOBAL SETUP COMPLETE'
echo '############################'
sleep 2

# ubuntu user setup
echo '#################'
echo 'UBUNTU USER SETUP'
echo '#################'
sleep 2
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
echo '######################'
sleep 2
mkdir /home/vagrant/flask_apps
cd /home/vagrant/flask_apps
python3.4 -m venv app01_env
source app01_env/bin/activate
pip install gunicorn flask
pip install setproctitle
cp /home/vagrant/vagrant/flask_app/app01.py /home/vagrant/flask_apps/app01_env/
cp /home/vagrant/vagrant/flask_app/wsgi.py /home/vagrant/flask_apps/app01_env/
cp /home/vagrant/vagrant/gunicorn/gunicorn_config.py /home/vagrant/flask_apps/app01_env/
deactivate
echo '###############################'
echo 'APP DEPENDENCIES SETUP COMPLETE'
echo '###############################'
sleep 2


# systemd setup
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

# nginx setup
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

echo '###############################################'
echo 'SCALABLE-UBUNTU-FLASK-GUNICORN-NGINX SUCCESSFUL'
echo '###############################################'
