#!/bin/bash

# Update the repositories
sudo apt update

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Install Telegram
sudo add-apt-repository ppa:atareao/telegram
sudo apt-get update
sudo apt-get install telegram

# Install Vim
sudo apt-get install vim

# Install VS Code
sudo snap install --classic code

# Install Valgrind
sudo apt-get install valgrind

# Install Grub Customizer
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer

