#!/bin/bash

#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License (the "License"); you may not
# use this file except in compliance with the License. You may obtain
# a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

# cisco.install
#
# This bundle installs Cisco ASDM for Mac.
#
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
NAME="Router Utility.app"
WHERE="Applications/Utilities"
SOURCE=""

# Remove existing installation.
if [ -s "$WHERE"/"$NAME" ]; then
    sudo rm -rf "$WHERE"/"$NAME"
fi

# Install.
sudo mkdir -p "$WHERE"/"$NAME"
curl -L# "$SOURCE" | sudo tar -xz -C "$WHERE"

# Opinions ----------------------------------------------------------------- #

# Relocate .asdm to Application Support.
mkdir -p "$HOME/Library/Application Support/Cisco/ASDM" &>/dev/null
chmod 700 "$HOME/Library/Application Support/Cisco/ASDM"
ln -sh "$HOME/Library/Application Support/Cisco/ASDM" "$HOME/.asdm" &>/dev/null
chmod -h 700 "$HOME/.asdm"

echo "Finished."
