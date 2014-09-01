#!/bin/sh
# Install script specific to the ubismart platform

# Install zeromq-node binaries so that npm install zmq works (for ubismart)
# https://github.com/JustinTulloss/zeromq.node/wiki/Installation
sudo add-apt-repository -y ppa:chris-lea/zeromq
sudo add-apt-repository -y ppa:chris-lea/libpgm
sudo apt-get -qq update
sudo apt-get install -y libzmq3-dev

# Install MQTT tools
sudo apt-get install -y mosquitto python-mosquitto mosquitto-clients
sudo rm /etc/init/mosquitto.conf # because I don't want mosquitto as a startup service

# Install i386 architecture & system-level 32bit libs to run yap (eye)
# This bit is Ubuntu 14.04 specific!
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
# Install yap specific 32bit lib
sudo apt-get install -y zlib1g:i386
