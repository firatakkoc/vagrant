# Flask App with Gunicorn and Nginx on Ubuntu 18.04 from Vagrant = bento/ubuntu18.04

## Description:

This solution provides scaffolding for a scalable Python Flask web application on Ubuntu 18.04 using Gunicorn and NGINX. The web application also leverages Virtualenv to leverage isolated Python environments.

## Deployment:

By executing the vagrant push (instructions below) you will have a "Hello World" web application which leverages Flask a microframework for Python and Gunicorn acting as a webserver with NGINX serving as a reverse proxy. Upon successful deployment and if port 8000 is open to you, going to the server IP in a browser (127.0.0.1:8000) will show you the message "Hello World" in red.

## Requirement:

* Vagrant

* VirtualBox

## Setup:

* Go into the download vagrant directory and run the vagrant up

```

git clone https://github.com/firatakkoc/vagrant.git

cd /vagrant

vagrant up

```

## What is the setup.sh script doing?


### Ubuntu setup

* Updating ubuntu packages
* Installing Python3 dependencies to support virtualenv
* Installing NGINX


### App dependencies setup

* Creating a directory structure for our test application named app01
* Leverage virtualenv to install Python3 packages in a virtual environment.
* Install gunicorn a webserver, flask a microframework, setproctitle for process friendly name
* Copy test application app01 to appropriate location from repo hierarchy
* Copy test application app01 gunicorn webserver config to appropriate location from repo hierarchy

### Systemd setup

* Copy test application app01 systemd bootstrap config to appropriate location from repo hierarchy
* Start test application app01 using systemd
* Configure test application app01 to start after reboots

### NGINX Setup

* Copy test application app01 nginx config to appropriate location from repo hierarchy
* Delete default nginx config
* Enable nginx site and restart nginx

END