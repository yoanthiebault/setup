setup.git
=========
Download and run this on a new Digital Ocean droplet running Ubuntu 14.04 LTS to
configure both the machine and your individual development environment as
follows:

```sh
wget -qO- https://github.com/tibotiber/setup/raw/master/update_locales.sh | sh
exit
# please ssh login as root again
wget -qO- https://github.com/tibotiber/setup/raw/master/setup.sh | sh
zsh
wget -qO- https://github.com/tibotiber/setup/raw/master/configure_zsh.sh | zsh
```
Run the following for ubismart only
```sh
wget -qO- https://github.com/tibotiber/setup/raw/master/ubi_setup.sh | sh
```

Note: You will probably need to exit and reconnect to apply the new shell profile.

See also http://github.com/tibotiber/dotfiles and
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.





