#!/usr/bin/env zsh

Setup Installation
==================

# git
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git git-lfs
git submodule update --init --recursive --depth 1

# zsh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# node
# .nvm
nvm install v4

# python
# .pyenv
pyenv global system

# ruby
# .rbenv
rbenv install 2.3.0

# go

# java

# nginx
sudo apt-get install nginx

# tmux
sudo apt-get install tmux

# thefuck
# sudo pip install thefuck

# sdkman
export SDKMAN_DIR="$dotfiles/.sdkman" && curl -s get.sdkman.io | bash

