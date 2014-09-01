#!/bin/sh
# Install script specific to the ubismart platform

# Install zeromq-node binaries so that npm install zmq works (for ubismart)
# https://github.com/JustinTulloss/zeromq.node/wiki/Installation
sudo add-apt-repository -y ppa:chris-lea/zeromq
sudo add-apt-repository -y ppa:chris-lea/libpgm
sudo apt-get -qq update
sudo apt-get install -y libzmq3-dev
