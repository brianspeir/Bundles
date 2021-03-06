#!/bin/bash

#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License (the "License"); you may not
# use this file except in compliance with the License. You may obtain
# a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

# ec2.install
#
# This bundle installs Amazon EC2 API Tools for Mac.
#
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
NAME="EC2.bundle"
WHERE="/Library/Bundles"
SOURCE="http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip"

# Remove existing installation.
if [ -s "$WHERE/$NAME" ]; then
    sudo rm -rf "$WHERE"/"$NAME"
fi

# Install.
sudo mkdir -p "$WHERE"/"$NAME"/Contents/MacOS
echo "Downloading..."
curl -L# "$SOURCE" | sudo tar -xz --strip-components 1 -C "$WHERE"/"$NAME"/Contents/MacOS
echo "Installing..."
sudo bash -c "cat > /Library/Bundles/EC2.bundle/Contents/Info.plist" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>English</string>
    <key>CFBundleExecutable</key>
    <string>ec2-version</string>
    <key>CFBundleIdentifier</key>
    <string>com.amazon.aws.EC2</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>EC2</string>
    <key>CFBundlePackageType</key>
    <string>BNDL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.6.10</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>NSHumanReadableCopyright</key>
    <string>Copyright © 2006-2010 Amazon.com, Inc. or its affiliates. All rights reserved.</string>
</dict>
</plist>
EOF
sudo chmod -R 755 "$WHERE"/"$NAME"

# Tell the tools where they live. Path setting for all users.
sudo bash -c "cat > /etc/paths.d/com.amazon.aws.EC2" <<'EOF'
/Library/Bundles/EC2.bundle/Contents/MacOS/bin
EOF

ec2-version
echo "Finished."
