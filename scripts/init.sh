#! /bin/bash

## wget https://rawgit.com/brianrackle/brainstem_breakfast/master/scripts/init.sh
## chmod +x init.sh
## ./init.sh

read -s -p "password: " sudoPW
echo $sudoPW | sudo -S apt update -y
echo $sudoPW | sudo -S apt upgrade -y
echo $sudoPW | sudo -S apt install -y gnome-tweak-tool gnome-shell-extensions gnome-session nodejs npm python3-dev libffi-dev libssl-dev update-manager terminator subversion emacs htop make g++ cmake git curl automake python3-pip open-vm-tools open-vm-tools-desktop

#nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

#virtualenv
#http://docs.python-guide.org/en/latest/dev/virtualenvs/
pip3 install virtualenv

#go
wget https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz
echo $sudoPW | sudo -S tar -C /usr/local -xzf go1.9.4.linux-amd64.tar.gz
echo $sudoPW | sudo -S sh -c 'printf "\nexport PATH=\$PATH:/usr/local/go/bin\n" >> /etc/profile'
mkdir go
mkdir go/src

#go dep
go get github.com/golang/dep/cmd/dep
echo $sudoPW | sudo -S sh -c 'printf "\nexport PATH=\$PATH:\$HOME/go/bin\n" >> /etc/profile'

# serverless
npm install -g serverless
