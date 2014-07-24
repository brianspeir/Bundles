#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  VirtualBox.sh
#  Bundles
#
#  This script installs VirtualBox for Mac.
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
SOURCE="http://download.virtualbox.org/virtualbox/4.3.14/VirtualBox-4.3.14-95030-OSX.dmg"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" -o ${TMPFILE=$(mktemp -t tmp)}
echo "Installing..."
hdiutil attach "$TMPFILE" -nobrowse -quiet -mountpoint ${TMPVOL=/Volumes/$(basename $TMPFILE)}
sudo installer -pkg "$TMPVOL"/*.pkg -tgt /
hdiutil detach -quiet "$TMPVOL"
rm "$TMPFILE"

echo "Current Version:" $(VBoxManage --version)

echo "Finished."
