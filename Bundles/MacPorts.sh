#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  MacPorts.sh
#  Bundles
#
#  This script installs MacPorts for Mac.
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
SOURCE="https://distfiles.macports.org/MacPorts/MacPorts-2.3.1-10.9-Mavericks.pkg"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" -o ${TMPFILE="$(mktemp -t tmp).pkg"}
echo "Installing..."
sudo installer -pkg "$TMPFILE" -tgt /
rm "$TMPDIR"tmp.*

# Keep things pretty and hide the ports folder.
sudo chflags hidden /opt

echo "Finished."
