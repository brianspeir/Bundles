#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  Node.sh
#  Bundles
#
#  This script installs Node.js for Mac.
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
SOURCE="http://nodejs.org/dist/v0.10.29/node-v0.10.29.pkg"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" -o ${TMPFILE="$(mktemp -t tmp).pkg"}
echo "Installing..."
sudo installer -pkg "$TMPFILE" -tgt /
rm "$TMPDIR"tmp.*

echo "Current Version:" $(node --version)

echo "Finished."
