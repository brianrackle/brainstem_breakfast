#! /bin/bash

## wget https://rawgit.com/brianrackle/brainstem_breakfast/master/scripts/init.sh
## chmod +x init.sh
## ./init.sh

read -s -p "password: " sudoPW
echo $sudoPW | sudo -S apt update -y
echo $sudoPW | sudo -S apt upgrade -y
echo $sudoPW | sudo -S apt install -y npm python3-dev libffi-dev libssl-dev update-manager terminator subversion emacs htop make g++ cmake git curl automake python3-pip open-vm-tools open-vm-tools-desktop

#virtualenv
#http://docs.python-guide.org/en/latest/dev/virtualenvs/
pip3 install virtualenv

sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}

npm install n --global
sudo n latest
