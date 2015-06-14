#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  IRC.sh
#  Bundles
#
#  This script installs an IRC Plugin for Messages.
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
NAME="IRC.imserviceplugin"
WHERE="/Library/Messages/PlugIns"
SOURCE="http://cdn.juicycocktail.com/download/IRC.imserviceplugin.zip"

# Remove existing installation.
if [ -s "$WHERE/$NAME" ]; then
    sudo rm -rf "$WHERE"/"$NAME"
fi

# Install.
echo "Downloading..."
curl -L# "$SOURCE" | sudo tar -xz -C "$WHERE"/
echo "Installing..."
sudo chmod -R 755 "$WHERE"/"$NAME"

echo "Finished."
