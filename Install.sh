#!/bin/sh

#
#  Copyright (C) 2013-2015 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  Install.sh
#  Bundles
#
#  Automate the installation of Bunles.
#


# Variables ---------------------------------------------------------- #

SOURCE="https://raw.githubusercontent.com/brianspeir/Bundles/master/Bundles"

echo ""
echo "Welcome to Bundles."
echo ""
echo "Please quit open apps."
echo ""
echo "To proceed, enter your password, or type Ctrl-C to abort."
echo ""
sudo -v

shopt -s nullglob

if [[ -n "$1" ]]; then
    # Argument passed from the command line
    SELECTION="$1"
else
    # Argument entered by the user.
    echo ""
    echo "To proceed, enter the name of the Bundle to install."
    echo "Press Return to perform a standard installation."
    echo ""
    echo -n "Install: "
    read 'SELECTION'
    if [[ -z "$SELECTION" ]]; then
        # Default argument.
        SELECTION="Canary Chrome CommandLineTools FirefoxDeveloper \
        Fonts IRC MacPorts Opera ProjectsFolder SourceTree SublimeTexts \
        Vagrant VirtualBox Wacom"
    fi
fi

# Installer ---------------------------------------------------------- #

for f in $(echo $SELECTION); do
    echo ""
    echo "$f bundle..."
    curl -Ls $SOURCE/$f.sh | sh
done

## Invalidate the user time stamp and require passwords again.
sudo -k

echo ""
echo "The installation was successful."
echo ""

exit
