##find prefered login manager
## Initialize Environment
su root
apt-get update -y
apt-get upgrade -y
apt-get install -y xfce4 build-essential module-assistant terminator subversion emacs htop ncurses-dev make ack-grep gnuplot-x11 curl g++ cmake git sudo

adduser brian sudo
reboot

##VirtualBox GuestAdditions
m-a prepare
bash /media/cdrom/VBoxLinuxAdditions.run

mkdir repos

cd ~/repos/
##install node
curl http://nodejs.org/dist/v0.12.0/node-v0.12.0.tar.gz | sh tar -zxf
cd node-v0.12.0
./configure --prefix=/opt/node && make -j 4 && sudo make install
##add to /etc/profile /opt/node/bin

##install-clang
cd ~/repos/
git clone https://github.com/rsmmr/install-clang.git
cd install-clang/
chmod 744 install-clang
./install-clang -j 4 /opt/llvm
##add to /etc/profile /opt/llvm/bin

printf "export CC=clang" >> ~/.bashrc
printf "export CCX=clang++" >> ~/.bashrc
#curl -sSLO https://cdn.rawgit.com/rsmmr/install-clang/master/install-clang#L6 | sudo sh -j 2 /opt/llvm

## Clone BSB
cd ~/repos/
git clone https://github.com/brianrackle/brainstem_breakfast.git
cd brainstem_breakfast/source
clang++ --std=c++14 --stdlib=libc++ main.cpp

## Install Jekyll
apt-get install -y ruby ruby-dev nodejs
gem install jekyll --no-rdoc --no-ri

## Install Graphics Drivers
## From Ctrl-Alt-F1 with 
#sudo stop lightdm
#sudo ubuntu-drivers devices
#sudo apt-get install -y nvidia-331 
#sudo apt-get --purge remove -y xserver-xorg-video-nouveau
#sudo start lightdm
