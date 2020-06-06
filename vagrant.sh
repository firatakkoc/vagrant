#!bin/bash

sudo apt-get install virtualbox -y

echo "################## virtualbox done  ##########################"

sudo apt-get install vagrant -y

echo "################## vagrant done #########################"

cd /Users/firat.akkoc/Documents/git_repo/vagrant

vagrant up Vagranfile

vagrant ssh


 


