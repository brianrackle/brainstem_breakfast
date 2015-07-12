## Initialize Environment
apt-get update -y
apt-get upgrade -y
apt-get install -y terminator subversion emacs htop make ack-grep gnuplot5 g++ cmake git curl automake

##install-clang
#cd ~/repos/
#git clone https://github.com/rsmmr/install-clang.git
#cd install-clang/
#chmod 744 install-clang

#./install-clang -j 4 /opt/llvm

##clone repos
mkdir repos
cd ~/repos/

git clone https://github.com/brianrackle/brainstem_breakfast.git
#git clone https://github.com/brianrackle/step_plot.git

#git clone https://github.com/gabime/spdlog.git
#git clone https://github.com/cppformat/cppformat.git
#git clone https://github.com/USCiLab/cereal.git
#git clone https://github.com/google/gumbo-parser.git

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
