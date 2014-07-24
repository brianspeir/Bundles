#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  Packer.sh
#  Bundles
#
#  This script installs Packer for Mac.
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
NAME="Packer.bundle"
WHERE="/Library/Bundles"
SOURCE="https://dl.bintray.com/mitchellh/packer/0.6.1_darwin_amd64.zip"

# Remove existing installation.
if [ -s "$WHERE/$NAME" ]; then
    sudo rm -rf "$WHERE"/"$NAME"
fi

# Install.
sudo mkdir -p "$WHERE"/"$NAME"/Contents/MacOS
echo "Downloading..."
curl -L# "$SOURCE" | sudo tar -xz -C "$WHERE"/"$NAME"/Contents/MacOS
echo "Installing..."
sudo bash -c "cat > /Library/Bundles/Packer.bundle/Contents/Info.plist" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>English</string>
    <key>CFBundleExecutable</key>
    <string>packer</string>
    <key>CFBundleIdentifier</key>
    <string>io.packer.Packer</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>Packer</string>
    <key>CFBundlePackageType</key>
    <string>BNDL</string>
    <key>CFBundleShortVersionString</key>
    <string>0.6.1</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>NSHumanReadableCopyright</key>
    <string>unknown</string>
</dict>
</plist>
EOF
sudo chmod -R 755 "$WHERE"/"$NAME"

# Other -------------------------------------------------------------- #

# Tell the tools where they live. Path setting for all users.
sudo bash -c "cat > /etc/paths.d/io.packer.Packer" <<'EOF'
/Library/Bundles/Packer.bundle/Contents/MacOS
EOF

echo "Current Version:" $(packer --version)

echo "Finished."
