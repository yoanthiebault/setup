#!/bin/sh

USER="tibo"

# create user
adduser --disabled-password --gecos "" $USER

# give sudo rights without password
sudo adduser $USER sudo
touch /etc/sudoers.tmp
sudo echo -e "# passwordless sudo functionality\n$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.tmp
visudo -c -f /etc/sudoers.tmp
if [ "$?" -eq "0" ]; then
    cp /etc/sudoers.tmp /etc/sudoers.d/nopwd
fi
rm /etc/sudoers.tmp
sudo service sudo restart

# change user
su $USER
cd

# authorize passwordless ssh login
mkdir .ssh/
sudo cp /root/.ssh/authorized_keys .ssh/
