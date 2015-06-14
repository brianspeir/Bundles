#!/bin/bash

#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License (the "License"); you may not
# use this file except in compliance with the License. You may obtain
# a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

# flash.install
#
# This bundle installs Adobe Flash.
#
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
SOURCE="http://get.adobe.com/flashplayer/download/?installer=Flash_Player_11_for_Mac_OS_X_10.6_-_10.9&os=OSX&browser_type=KHTML&browser_dist=Safari"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" -o ${TMPFILE=$(mktemp -t tmp)}
echo "Installing..."
hdiutil attach "$TMPFILE" -nobrowse -quiet -mountpoint ${TMPVOL=/Volumes/$(basename $TMPFILE)}
sudo installer -pkg "$TMPVOL"/*.mpkg -tgt /
hdiutil detach -quiet "$TMPVOL"
rm "$TMPFILE"

echo "Finished."
