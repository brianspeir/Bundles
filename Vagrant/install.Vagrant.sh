#!/bin/bash
#

# Prompt for a password and extend the time stamp.
sudo -v

# Install Vagrant as a bundle.
curl -L --create-dirs http://files.vagrantup.com/packages/476b19a9e5f499b5d0b9d4aba5c0b16ebe434311/Vagrant.dmg -o /tmp/Vagrant/bundle.dmg
hdiutil attach /tmp/Vagrant/bundle.dmg
sudo installer -pkg /Volumes/Vagrant/Vagrant.pkg -tgt /
hdiutil detach /Volumes/Vagrant
sudo mv /Applications/Vagrant /Library/Bundles/Vagrant.bundle
sudo ln -sf /Library/Bundles/Vagrant.bundle/bin/vagrant /usr/bin/vagrant
sudo curl https://raw.github.com/BrianSpeir/Bundles/master/Vagrant/Info.plist -o /Library/Bundles/Vagrant.bundle/Info.plist
# Set DEFAULT_HOME = "~/Library/Application Support/Vagrant" to better support practices listed in File System Programing Guide for Mac OS X
sudo curl https://raw.github.com/BrianSpeir/Bundles/master/Vagrant/environment.rb -o /Library/Bundles/Vagrant.bundle/embedded/gems/gems/vagrant-1.0.6/lib/vagrant/environment.rb
sudo chmod -R 755 /Library/Bundles/Vagrant.bundle
rm -rf /tmp/Vagrant/

# Invalidate the user time stamp and require passwords again.
sudo -k
exit
