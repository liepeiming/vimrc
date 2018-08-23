#!/bin/bash

git clone https://github.com/chxuan/vimplus.git ~/.vimplus
cp ./vimrc ~/.vimplus/
cp ~/.ycm_extra_conf.py ~/.vimplus/
cd ~/.vimplus
./install.sh
