#!/bin/sh

USER=$1
NOPWD="/etc/sudoers.d/nopwd"
TMP="/etc/sudoers.tmp"

# create user
adduser --disabled-password --gecos "" $USER

# give sudo rights without password
sudo adduser $USER sudo
if [ -f "$NOPWD" ]; then
    cp $NOPWD $TMP
else
    touch $TMP
    sudo echo -e "# passwordless sudo functionality" > $TMP
fi
sudo echo -e "$USER ALL=(ALL) NOPASSWD:ALL" >> $TMP
visudo -c -f $TMP
if [ "$?" -eq "0" ]; then
    cp $TMP $NOPWD
fi
rm $TMP
sudo service sudo restart

# authorize passwordless ssh login
mkdir /home/$USER/.ssh/
sudo cp /root/.ssh/authorized_keys /home/$USER/.ssh/
chown -R $USER:$USER /home/$USER/.ssh/
