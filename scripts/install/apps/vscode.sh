#!/usr/bin/bash

## add repo
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

## install
sudo apt install code

## extensions / config
ln $DOTFILES/config/.vscode/extensions.json $HOME/.vscode/extensions.json
