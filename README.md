# Flask App with Gunicorn and Nginx on Ubuntu 18.04 from Vagrant = bento/ubuntu18.04

## Description:

This solution provides scaffolding for a scalable Python Flask web application on Ubuntu 14.04 using Gunicorn and NGINX. The web application also leverages Virtualenv to leverage isolated Python environments.

## Deployment:

By executing the setup.sh script (instructions below) you will have a "Hello World" web application which leverages Flask a microframework for Python and Gunicorn acting as a webserver with NGINX serving as a reverse proxy. Upon successful deployment and if port 80 is open to you, going to the server IP in a browser will show you the message "Hello World" in red.

## Requirement:

* Vagrant

* VirtualBox

## Setup:

* SSH onto your we created with Vagrantfile VM and clone the repo into your /home/vagrant directory
* Go into the setup directory and run the setup.sh script

```bash
git clone https://github.com/firatakkoc/vagrant.git

cd vagrant/vagrant/setup

bash setup.sh
```

## What is the setup.sh script doing?

Below are the general steps the setup.sh file is executing. Please see the actual setup.sh file in the setup directory for literal commands.

### Ubuntu global setup

* Updating ubuntu packages
* Installing ntpdate and updating time against pool.ntp.org
* Installing nptd to maintain time avoiding drift
* Installing Python3 dependencies to support virtualenv
* Installing NGINX

### Ubuntu user setup

* Updating .bashrc of the ubuntu user to support virtualenv for development

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

## Performance notes:

* Gunicorn is configured with 5 workers leveraging threading (2 per worker) each worker can handle 1000 connections. Typical formula is 2 workers per cpu core +1 worker
* Gunicorn Timeout value is set to 30 seconds and keepalive is set to 2 seconds
* NGINX is set to use 8 buffers and 24K size per buffer when reading a response from the proxied server for a single connection
* NGINX is set to 4k buffer size used for headers from the pool
* NGINX worker_processes are set to "auto" for detecting number of cores and setting that value
