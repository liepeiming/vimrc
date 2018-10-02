#!/bin/bash

git clone https://github.com/chxuan/vimplus.git ~/.vimplus
cp -ra ./vimrc ~/.vimplus/
cp -ra ~/ycm_extra_conf.py ~/.vimplus/
cd ~/.vimplus
./install.sh
