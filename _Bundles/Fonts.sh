#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  Fonts.sh
#  Bundles
#
#  This script installs various open source fonts.
#


# Roboto Fonts --------------------------------------------------- #

# Set installation variables.
WHERE="$HOME/Library/Fonts"
SOURCE="https://material-design.storage.googleapis.com/publish/material_v_4/material_ext_publish/0B0J8hsRkk91LRjU4U1NSeXdjd1U/RobotoTTF.zip"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" | tar -xz --exclude={"EOT/*","SVG/*","TTF/*","WOFF/*","*.html","*.rtf","*.txt",.DS_Store} -C "$WHERE"
echo "Installing..."

echo "Finished."


# Source Code Pro v1.017 --------------------------------------------------- #

# Set installation variables.
WHERE="$HOME/Library/Fonts"
SOURCE="https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" | tar -xz --exclude={"EOT/*","SVG/*","TTF/*","WOFF/*","*.html","*.txt",.DS_Store} --strip-components 2 -C "$WHERE"
echo "Installing..."

echo "Finished."

# Source Sans Pro v2.010 --------------------------------------------------- #

# Set installation variables.
WHERE="$HOME/Library/Fonts"
SOURCE="https://github.com/adobe-fonts/source-sans-pro/archive/2.010R-ro/1.065R-it.zip"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" | tar -xz --exclude={"EOT/*","SVG/*","TTF/*","WOFF/*","*.html","*.txt",.DS_Store} --strip-components 2 -C "$WHERE"
echo "Installing..."

echo "Finished."

# Source Serif Pro v1.017 --------------------------------------------------- #

# Set installation variables.
WHERE="$HOME/Library/Fonts"
SOURCE="https://github.com/adobe-fonts/source-serif-pro/archive/1.017R.zip"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" | tar -xz --exclude={"EOT/*","SVG/*","TTF/*","WOFF/*","*.html","*.txt",.DS_Store} --strip-components 2 -C "$WHERE"
echo "Installing..."

echo "Finished."
