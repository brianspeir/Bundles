#!/bin/bash
#

# Name your project. Must match parent folder name.
# Permitted characters are the same as those for URLs (letters, numbers, dash)
PROJECT_NAME='Project-Name'

# Install PIP via Distribute
cd /tmp/
curl -O http://python-distribute.org/distribute_setup.py
python distribute_setup.py
easy_install pip
sudo rm /tmp/*.gz
sudo rm /tmp/*.py

# Update apt-get
sudo apt-get update

# Install requirements
sudo pip install -r /Projects/$PROJECT_NAME/requirements.txt
