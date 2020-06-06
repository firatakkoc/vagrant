# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Flask
  config.vm.network "127.0.0.1", guest: 5000, host: 5000

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

$provisioner = <<SCRIPT
echo "#!/bin/bash
function InstallPip {
  if [ '$(which pip)' ]; then
    echo '-- Already installed.'
    return
  fi
  apt-get install python-dev python-setuptools -y -qq
  curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py
  python get-pip.py
  rm get-pip.py
}
echo 'Installing Pip...'; InstallPip
echo 'Installing Flask...'; pip install flask
exit 0" | /bin/bash
SCRIPT


end
