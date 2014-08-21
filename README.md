setup.git
=========
Download and run this on a new EC2 instance running Ubuntu 14.04 LTS to
configure both the machine and your individual development environment as
follows:

```sh
wget -qO- https://github.com/tibotiber/ec2-setup/raw/master/setup.sh | sh
zsh
wget -qO- https://github.com/tibotiber/ec2-setup/raw/master/configureZSH.sh | zsh
```

Note: You will probably need to exit and reconnect to apply the new shell profile.

See also http://github.com/tibotiber/ec2-dotfiles and
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.





