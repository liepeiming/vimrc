#!/bin/bash

sudo yum upgrade
sudo yum update
sudo yum install git-core wget unzip 

sudo yum install centos-release-scl
sudo yum install devtoolset-3-toolchain
sudo yum install gcc gcc-c++
sudo scl enable devtoolset-3 bash
sudo ldconfig

yum install ncurses-devel


yum install perl perl-devel #让vim支持perl解释器
yum install perl-ExtUtils-Embed #安装包解决：找不到EXTERN.h文件的问题
yum install ruby ruby-devel #让vim支持ruby解释器
yum install lua lua-devel #让vim支持lua解释器
yum install python python36 python-devel python36-devel #让vim支持python解释器

sudo ldconfig


cd ~/Downloads
git clone https://github.com/vim/vim.git

./configure --prefix=/opt/vim8 --enable-fail-if-missing -enable-pythoninterp   --enable-python3interp --enable-multibyte --enable-fontset --with-features=huge   --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu --with-python-config-dir=/usr/lib64/python2.7/config  --enable-perlinterp  --enable-rubyinterp  --enable-luainterp  --with-lua-prefix=$LUA_PREFIX  --enable-sniff  --enable-fontset --enable-cscope  --disable-gui
make
sudo make install


