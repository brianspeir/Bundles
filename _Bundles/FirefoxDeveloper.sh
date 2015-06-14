#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  FirefoxDeveloper.sh
#  Bundles
#
#  This script installs Firefox Developer Edition for Mac.
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
NAME="FirefoxDeveloperEdition.app"
WHERE="/Applications"
SOURCE="https://download.mozilla.org/?product=firefox-aurora-latest&os=osx&lang=en-US"

# Remove existing installation.
if [ -s "$WHERE"/"$NAME" ]; then
    sudo rm -rf "$WHERE"/"$NAME"
fi

# Install.
echo "Downloading..."
curl -L# "$SOURCE" -o ${TMPFILE=$(mktemp -t tmp)}
echo "Installing..."
hdiutil attach "$TMPFILE" -nobrowse -quiet -mountpoint ${TMPVOL=/Volumes/$(basename $TMPFILE)}
sudo cp -R "$TMPVOL"/"$NAME" "$WHERE"/
hdiutil detach -quiet "$TMPVOL"
rm "$TMPFILE"

echo "Finished."
