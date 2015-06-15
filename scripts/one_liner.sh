## Initialize Environment
apt-get update -y
apt-get upgrade -y
apt-get install -y xrdp terminator subversion emacs htop ncurses-dev make ack-grep gnuplot5 g++ cmake git clang-3.6 lldb-3.6 clang-format-3.6 libboost-all-dev curl libcurl4-openssl-dev libxml2 libxml2-dev automake

##Hyper-V
#http://blogs.msdn.com/b/virtual_pc_guy/archive/2008/01/09/using-hyper-v-with-a-wireless-network-adapter.aspx
#sudo apt-get install linux-image-extra-virtual
#Set GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=hyperv_fb:1920x1080" in /etc/default/grub.
#Update grub: sudo update-grub

##VirtualBox GuestAdditions
#m-a prepare
#bash ./media/cdrom/VBoxLinuxAdditions.run

sudo service xrdp start
#ifconfig inet: xxx.xxx.xxx.xxx 

##install-clang
cd ~/repos/
git clone https://github.com/rsmmr/install-clang.git
cd install-clang/
chmod 744 install-clang

./install-clang -j 4 /opt/llvm
#add to /etc/profile /opt/llvm/bin

#setup clang
printf "alias clang='clang-3.6'" >> ~/.bash_aliases
printf "alias clang++='clang++-3.6'" >> ~/.bash_aliases
printf "export CC=clang" >> ~/.bashrc
printf "export CCX=clang++" >> ~/.bashrc

#install codelite
apt-key adv --fetch-keys http://repos.codelite.org/CodeLite.asc
apt-add-repository 'deb http://repos.codelite.org/ubuntu/ vivid universe'
apt-get update
apt-get install codelite wxcrafter

##clone repos
mkdir repos
cd ~/repos/

git clone https://github.com/brianrackle/brainstem_breakfast.git
git clone https://github.com/brianrackle/step_plot.git

git clone https://github.com/gabime/spdlog.git
git clone https://github.com/cppformat/cppformat.git
git clone https://github.com/USCiLab/cereal.git
git clone https://github.com/google/gumbo-parser.git

#cd brainstem_breakfast/source
#clang++ --std=c++14 --stdlib=libc++ main.cpp

## Install Jekyll
apt-get install -y ruby ruby-dev nodejs
gem install jekyll --no-rdoc --no-ri

#cd ~/repos/
##install node
#curl http://nodejs.org/dist/v0.12.0/node-v0.12.0.tar.gz | sh tar -zxf
#cd node-v0.12.0
#./configure --prefix=/opt/node && make -j 4 && sudo make install
##add to /etc/profile /opt/node/bin

## Install Graphics Drivers
## From Ctrl-Alt-F1 with 
#sudo stop lightdm
#sudo ubuntu-drivers devices
#sudo apt-get install -y nvidia-331 
#sudo apt-get --purge remove -y xserver-xorg-video-nouveau
#sudo start lightdm
