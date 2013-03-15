#!/bin/bash
#

# Prompt for a password and extend the time stamp.
sudo -v

# Version 1.1.0
if [ "/Library/Bundles/Vagrant.bundle" = "/Library/Bundles/Vagrant.bundle" ];
    then sudo rm -rf /Library/Bundles/Vagrant.bundle
fi
curl -L "http://files.vagrantup.com/packages/194948999371e9aee391d13845a0bdeb27e51ac0/Vagrant.dmg" --create-dirs -o /tmp/Vagrant/Install.dmg
hdiutil attach /tmp/Vagrant/Install.dmg
sudo installer -pkg /Volumes/Vagrant/Vagrant.pkg -tgt /
hdiutil detach /Volumes/Vagrant
sudo mv /Applications/Vagrant /Library/Bundles/Vagrant.bundle
sudo ln -sf /Library/Bundles/Vagrant.bundle/bin/vagrant /usr/bin/vagrant
sudo curl https://raw.github.com/BrianSpeir/Bundles/master/Vagrant/Info.plist -o /Library/Bundles/Vagrant.bundle/Info.plist
sudo curl https://raw.github.com/BrianSpeir/Bundles/master/Vagrant/environment.rb -o "/Library/Bundles/Vagrant.bundle/embedded/gems/gems/vagrant-1.1.0/lib/vagrant/environment.rb"
sudo chmod -R 755 /Library/Bundles/Vagrant.bundle
rm -rf /tmp/Vagrant/
vagrant plugin install vagrant-aws
vagrant plugin install vagrant-rackspace

# Invalidate the user time stamp and require passwords again.
sudo -k
exit
