#!/bin/bash
#

# Prompt for a password and extend the time stamp.
sudo -v

# Install Amazon EC2 API tools as a bundle.
# aws.amazon.com/developertools/351
sudo curl -L --create-dirs https://raw.github.com/BrianSpeir/Bundles/master/EC2/Info.plist -o /Library/Bundles/EC2.bundle/Info.plist
curl -L http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip > /tmp/ec2.zip
sudo tar -xf /tmp/ec2.zip --strip-components 1 -C /Library/Bundles/EC2.bundle/
sudo chmod -R 755 /Library/Bundles/EC2.bundle
rm -rf /tmp/ec2.zip

# Invalidate the user time stamp and require passwords again.
sudo -k
