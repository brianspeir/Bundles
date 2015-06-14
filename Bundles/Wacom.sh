#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  Wacom.sh
#  Bundles
#
#  This script installs Wacom Drivers for Mac.
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
NAME="Wacom Tablet Utility.app"
WHERE="/Applications/Utilities"
SOURCE="http://cdn.wacom.com/u/productsupport/drivers/mac/professional/WacomTablet_6.3.11-3a.dmg"

# Remove existing installation.
if [ -s "$WHERE"/"$NAME" ]; then
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

# Move app to the Utilities folder.
sudo mv "/Applications/Wacom Tablet.localized/$NAME" "$WHERE"/"$NAME"
sudo rm -rf "/Applications/Wacom Tablet.localized"

# Disable Internet Plug-Ins
sudo mkdir -p "/Library/Internet Plug-Ins/disabled" &>/dev/null
sudo mv "/Library/Internet Plug-Ins/WacomNetscape.plugin" "/Library/Internet Plug-Ins/disabled" &>/dev/null
sudo mv "/Library/Internet Plug-Ins/WacomTabletPlugin.plugin" "/Library/Internet Plug-Ins/disabled" &>/dev/null

echo "Finished."
