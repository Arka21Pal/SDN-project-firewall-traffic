#!/bin/sh

# Update repositories
sudo apt-get update

# Install python3-pip
sudo apt-get python3-pip

# Install the base version of ryu
sudo pip3 install ryu

# The latest version of "eventlet" has a problem in Ubuntu 20.04
# Uninstall it and install a compatible version
sudo pip3 uninstall eventlet
sudo pip3 install "eventlet==0.30.2"

# To test ryu, try this
# Open a separate terminal

# In the first terminal, type:
# sudo mn --topo single,3 --mac --controller remote --switch ovsk

# In the second terminal, type:
# ryu-manager ryu.app.simple_switch

# Go back to the first terminal and do a ping test
# mininet> pingall

# Go to the second terminal and check if it shows mac addresses as packets flow
# If it does, ryu is working
# Otherwise, troubleshoot

# Links for reference
# https://stackoverflow.com/questions/67409452/gunicorn-importerror-cannot-import-name-already-handled-from-eventlet-wsgi
# https://ernie55ernie.github.io/sdn/2019/03/25/install-mininet-and-ryu-controller.html
