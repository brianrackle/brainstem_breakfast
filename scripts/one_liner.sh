## Initialize Environment
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y terminator subversion emacs htop make ack-grep gnuplot5 g++ cmake git curl automake python3 python3-pip nodejs-legacy npm open-vm-tools open-vm-tools-desktop

sudo mount -t vmhgfs .host:/ /home/brian/shares

#atom
cd ~/Downloads/
wget https://atom.io/download/deb atom.deb
sudo dpkg -i atom.deb
sudo apt-get install -f

#erlang
cd ~/Downloads/
wget http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/esl-erlang_18.1-1~ubuntu~vivid_amd64.deb erlang.deb
sudo dpkg -i erlang.deb
sudo apt-get install -f

#elixir
cd ~/Downloads/
wget http://packages.erlang-solutions.com/site/esl/elixir/FLAVOUR_2_download/elixir_1.1.1-1~ubuntu~vivid_amd64.deb elixir.deb
sudo dpkg -i elixir.deb
sudo apt-get install -f
mix local.hex

#phoenix
mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.0.3/phoenix_new-1.0.3.ez

#postgres
sudo apt-get install postgresql-9.4
sudo -u postgres psql postgres
\password postgres

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
sudo apt-get install -y ruby ruby-dev nodejs
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
