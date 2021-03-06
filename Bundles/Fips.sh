#!/bin/bash

#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License (the "License"); you may not
# use this file except in compliance with the License. You may obtain
# a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

# fips.install
#
# This bundle installs the Apple FIPS Cryptographics Module.
#
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
SOURCE="http://support.apple.com/downloads/DL1555/en_US/FIPS.dmg"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" -o ${TMPFILE=$(mktemp -t tmp)}
echo "Installing..."
hdiutil attach "$TMPFILE" -nobrowse -quiet -mountpoint ${TMPVOL=/Volumes/$(basename $TMPFILE)}
sudo installer -pkg "$TMPVOL"/*.pkg -tgt /
hdiutil detach -quiet "$TMPVOL"
rm "$TMPFILE"

echo "Finished."
