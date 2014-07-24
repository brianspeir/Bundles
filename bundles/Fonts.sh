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


# Source Code Pro v1.017 --------------------------------------------------- #

# Set installation variables.
WHERE="$HOME/Library/Fonts"
SOURCE="http://sourceforge.net/projects/sourcecodepro.adobe/files/SourceCodePro_FontsOnly-1.017.zip/download"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" | tar -xz --exclude={"TTF/*","*.html","*.txt",.DS_Store} --strip-components 2 -C "$WHERE"
echo "Installing..."

echo "Finished."

# Source Sans Pro v1.050 --------------------------------------------------- #

# Set installation variables.
WHERE="$HOME/Library/Fonts"
SOURCE="http://sourceforge.net/projects/sourcesans.adobe/files/SourceSansPro_FontsOnly-1.050.zip/download"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" | tar -xz --exclude={"TTF/*","*.html","*.txt",.DS_Store} --strip-components 2 -C "$WHERE"
echo "Installing..."

echo "Finished."
