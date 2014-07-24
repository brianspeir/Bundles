#!/bin/bash

#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License (the "License"); you may not
# use this file except in compliance with the License. You may obtain
# a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

# p4-merge.install
#
# This bundle installs Perforce P4Merge: Visual Merge Tool for Mac.
#
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
NAME="p4merge.app"
WHERE="/Applications"
SOURCE="http://www.perforce.com/downloads/perforce/r13.2/bin.macosx106x86_64/P4V.dmg"

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

# Set font and size.
cat > "$HOME/Library/Preferences/com.perforce.p4merge/ApplicationSettings.xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!--perforce-xml-version=1.0-->
<PropertyList varName="ApplicationSettings" IsManaged="TRUE">
 <Font varName="Font">
  <family>Source Code Pro</family>
  <pointSize>12</pointSize>
  <weight>Normal</weight>
  <italic>false</italic>
 </Font>
</PropertyList>
EOF

# Path to run P4Merge from the command line.
sudo bash -c "cat > /etc/paths.d/com.perforce.p4merge" <<'EOF'
/Applications/p4merge.app/Contents/Resources
EOF
