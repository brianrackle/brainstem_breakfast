#! /bin/bash

## wget https://rawgit.com/brianrackle/brainstem_breakfast/master/scripts/init.sh
## chmod +x init.sh
## ./init.sh

read -s -p "password: " sudoPW
echo $sudoPW | sudo -S apt update -y
echo $sudoPW | sudo -S apt upgrade -y
echo $sudoPW | sudo -S apt install -y npm python3-dev libffi-dev libssl-dev update-manager terminator subversion emacs htop make ack-grep g++ cmake git curl automake python3-pip open-vm-tools open-vm-tools-desktop

#virtualenv
#http://docs.python-guide.org/en/latest/dev/virtualenvs/
pip3 install virtualenv

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
source ~/.profile

npm install n --global
n latest
