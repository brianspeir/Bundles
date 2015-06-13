#!/bin/sh

#
#  Copyright (C) 2015 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  SublimeText.sh
#  Bundles
#
#  This script installs Sublime Text 3 for Mac.
#


# Prompt for a password and extend the time stamp.
sudo -v

# Set installation variables.
NAME="Sublime Text.app"
WHERE="/Applications"
SOURCE="http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203083.dmg"

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

# Sublime Text Package Control --------------------------------------------- #

# Set installation variables.
NAME="Package Control.sublime-package"
WHERE="$HOME/Library/Application Support/Sublime Text 3/Installed Packages"
SOURCE="https://packagecontrol.io/Package%20Control.sublime-package"


# Remove existing installation.
if [ -s "$WHERE/$NAME" ]; then
    sudo rm -rf "$WHERE"/"$NAME"
fi

# Install.
curl -L# "$SOURCE" --create-dirs -o "$WHERE"/"$NAME"

# Other -------------------------------------------------------------------- #

# Install Soda Theme colours (replace with personal colors)
mkdir -p "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
curl -L# https://buymeasoda.github.com/soda-theme/extras/colour-schemes.zip | \
    tar -xz --exclude="Monokai Soda.tmTheme" -C $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# Fix Ruby sytax to recognize Vagrantfile
/usr/libexec/PlistBuddy -c "Add :fileTypes: string Vagrantfile" $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/Ruby/Ruby.tmLanguage &>/dev/null

echo "Finished."
