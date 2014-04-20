#!/bin/bash

#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License (the "License"); you may not
# use this file except in compliance with the License. You may obtain
# a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

# project-folder.install
#
# This bundle creates an iconed Projects folder in user home.
#
#


# Set installation variables.
WHERE="$HOME"
SOURCE="https://github.com/brianspeir/Bundles/raw/master/bundles/resources/projects-folder.zip"

# Install.
echo "Downloading..."
curl -L# "$SOURCE" -o ${TMPFILE=$(mktemp -t tmp)}
echo "Installing..."
ditto -xk "$TMPFILE" "$WHERE"
chmod +a "group:everyone deny delete" "$WHERE"/Projects/Icon*
chmod +a "group:everyone deny delete" "$WHERE"/Projects
rm "$TMPFILE"

echo "Finished."
