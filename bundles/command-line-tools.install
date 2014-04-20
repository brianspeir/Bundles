#!/bin/bash

#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License (the "License"); you may not
# use this file except in compliance with the License. You may obtain
# a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

# command-line-tools.install
#
# This bundle installs Xcode Command-Line Tools.
#
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
SOURCE="http://devimages.apple.com/downloads/xcode/command_line_tools_os_x_mountain_lion_for_xcode__september_2013.dmg"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" -o ${TMPFILE=$(mktemp -t tmp)}
echo "Installing..."
hdiutil attach "$TMPFILE" -nobrowse -quiet -mountpoint ${TMPVOL=/Volumes/$(basename $TMPFILE)}
sudo installer -pkg "$TMPVOL"/*.mpkg -tgt /
hdiutil detach -quiet "$TMPVOL"
rm "$TMPFILE"

# Opinions ----------------------------------------------------------------- #

# Accept Xcode End User Licensing Agreement.
defaults write com.apple.dt.Xcode IDELastGMLicenseAgreedTo -string "EA0720"
defaults write com.apple.dt.Xcode IDEXcodeVersionForAgreedToGMLicense -string "4.6.3"

echo "Finished."
