
## Initialize Environment
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y subversion  emacs  xdg-utils htop ncurses-dev ruby ruby-dev nodejs make default-jre default-jdk ack-grep gnuplot-x11 zram-config
sudo mkdir repos

##install-clang
sudo apt-get install -y curl g++ cmake git
cd ~/repos/
sudo git clone https://github.com/rsmmr/install-clang.git
cd install-clang/
sudo chmod 744 install-clang
sudo ./install-clang -j 2 /opt/llvm
#curl -sSLO https://cdn.rawgit.com/rsmmr/install-clang/master/install-clang#L6 | sudo sh -j 2 /opt/llvm

#.bashrc
#export CC=clang
#export CXX=clang++

## Setup Emacs
xdg-mime default emacs.desktop text/plain

## Clone BSB
cd ~/repos/
sudo git clone https://github.com/brianrackle/brainstem_breakfast.git
cd brainstem_breakfast/source
sudo clang++ --std=c++14 --stdlib=libc++ main.cpp

## Install Jekyll
sudo gem install jekyll --no-rdoc --no-ri

## Install Graphics Drivers
## From Ctrl-Alt-F1 with 
#sudo stop lightdm
#sudo ubuntu-drivers devices
#sudo apt-get install -y nvidia-331 
#sudo apt-get --purge remove -y xserver-xorg-video-nouveau
#sudo start lightdm

## All
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install -y build-essential g++ subversion cmake emacs git xdg-utils htop ncurses-dev ruby ruby-dev nodejs make default-jre default-jdk ack-grep gnuplot-x11 zram-config && sudo mkdir repos && cd ~/repos/ && sudo mkdir llvm_src && cd llvm_src && sudo svn co http://llvm.org/svn/llvm-project/llvm/branches/release_35/ llvm && cd llvm/tools && sudo apt-get build-dep lldb-3.5 && sudo svn co http://llvm.org/svn/llvm-project/cfe/branches/release_35/ clang && sudo svn co http://llvm.org/svn/llvm-project/lldb/branches/release_35/ lldb && cd ~/repos/llvm_src && sudo mkdir build_llvm && cd build_llvm && sudo ../llvm/configure --enable-optimized --enable-targets=host --disable-compiler-version-checks && sudo make -j 4 && sudo make install && cd ~/repos/llvm_src && sudo svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx && sudo mkdir build_libcxx && cd build_libcxx && sudo CC=clang CXX=clang++ cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libsupc++ -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS="/usr/include/c++/4.8;/usr/include/x86_64-linux-gnu/c++/4.8" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr $HOME/repos/llvm_src/libcxx && sudo make -j 4 && sudo make install && xdg-mime default emacs.desktop text/plain && cd ~/repos/ && sudo git clone https://github.com/brianrackle/brainstem_breakfast.git && cd brainstem_breakfast/source && sudo clang++ --std=c++14 --stdlib=libc++ main.cpp && sudo gem install jekyll --no-rdoc --no-ri
