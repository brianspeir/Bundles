#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  Java.sh
#  Bundles
#
#  This script installs Java Development Kit for Mac.
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
SOURCE="http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-macosx-x64.dmg"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" -o ${TMPFILE=$(mktemp -t tmp)}
echo "Installing..."
hdiutil attach "$TMPFILE" -nobrowse -quiet -mountpoint ${TMPVOL=/Volumes/$(basename $TMPFILE)}
sudo installer -pkg "$TMPVOL"/*.pkg -tgt /
hdiutil detach -quiet "$TMPVOL"
rm "$TMPFILE"

# echo "Current Version:" $(java --version)

echo "Finished."
