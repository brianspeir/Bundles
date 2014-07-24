#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  Vagrant.sh
#  Bundles
#
#  This script installs Vagrant for Mac.
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
NAME="Vagrant.bundle"
WHERE="/Library/Bundles"
SOURCE="https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3.dmg"

# Remove existing installation.
if [ -s "$WHERE/$NAME" ]; then
    sudo rm -rf "$WHERE"/"$NAME"
fi

# Install.
echo "Downloading..."
curl -L# "$SOURCE" -o ${TMPFILE=$(mktemp -t tmp)}
echo "Installing..."
hdiutil attach "$TMPFILE" -nobrowse -quiet -mountpoint ${TMPVOL=/Volumes/$(basename $TMPFILE)}
sudo installer -pkg "$TMPVOL"/*.pkg -tgt /
hdiutil detach -quiet "$TMPVOL"
rm "$TMPFILE"
sudo mkdir -p "$WHERE"/"$NAME"/Contents
sudo mv /Applications/Vagrant "$WHERE"/"$NAME"/Contents/MacOS
sudo ln -sf "$WHERE"/"$NAME"/Contents/MacOS/bin/vagrant /usr/bin/vagrant
sudo bash -c "cat > /Library/Bundles/Vagrant.bundle/Contents/Info.plist" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>English</string>
    <key>CFBundleExecutable</key>
    <string>vagrant</string>
    <key>CFBundleIdentifier</key>
    <string>com.vagrantup.Vagrant</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>Vagrant</string>
    <key>CFBundlePackageType</key>
    <string>BNDL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.6.3</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>NSHumanReadableCopyright</key>
    <string>Copyright © 2010-2014 Mitchell Hashimoto.</string>
</dict>
</plist>
EOF
sudo chmod -R 755 "$WHERE"/"$NAME"

echo "Current Version:" $(vagrant --version)

echo "Finished."
