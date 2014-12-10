
## Initialize Environment
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y subversion  emacs  xdg-utils htop ncurses-dev make default-jre default-jdk ack-grep gnuplot-x11 zram-config
sudo mkdir repos

##install-clang
sudo apt-get install -y curl g++ cmake git
cd ~/repos/
sudo git clone https://github.com/rsmmr/install-clang.git
cd install-clang/
sudo chmod 744 install-clang
sudo ./install-clang -j 2 /opt/llvm
printf "export PATH=/opt/llvm/bin:$PATH" >> ~/.bashrc
printf "export CC=clang" >> ~/.bashrc
printf "export CCX=clang++" >> ~/.bashrc
#curl -sSLO https://cdn.rawgit.com/rsmmr/install-clang/master/install-clang#L6 | sudo sh -j 2 /opt/llvm

## Setup Emacs
xdg-mime default emacs.desktop text/plain

## Clone BSB
cd ~/repos/
sudo git clone https://github.com/brianrackle/brainstem_breakfast.git
cd brainstem_breakfast/source
sudo clang++ --std=c++14 --stdlib=libc++ main.cpp

## Install Jekyll
sudo apt-get install -y ruby ruby-dev nodejs
sudo gem install jekyll --no-rdoc --no-ri

## Install Graphics Drivers
## From Ctrl-Alt-F1 with 
#sudo stop lightdm
#sudo ubuntu-drivers devices
#sudo apt-get install -y nvidia-331 
#sudo apt-get --purge remove -y xserver-xorg-video-nouveau
#sudo start lightdm
