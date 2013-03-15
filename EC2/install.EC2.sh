#!/bin/bash
#

# Prompt for a password and extend the time stamp.
sudo -v

# Install Amazon EC2 API tools as a bundle.
# aws.amazon.com/developertools/351
# Version 1.6.7 2013-02-01
sudo curl https://raw.github.com/BrianSpeir/Bundles/master/EC2/Info.plist --create-dirs -o /Library/Bundles/EC2.bundle/Info.plist
curl -L http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip --create-dirs -o /tmp/EC2/Install.zip
sudo tar -xf /tmp/EC2/Install.zip --strip-components 1 -C /Library/Bundles/EC2.bundle/
sudo chmod -R 755 /Library/Bundles/EC2.bundle
rm -rf /tmp/EC2/

# Invalidate the user time stamp and require passwords again.
sudo -k
exit
