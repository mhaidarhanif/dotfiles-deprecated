#!/usr/bin/env zsh

Setup Installation
==================

# git
sudo apt-get install git

# zsh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# node
git clone --depth 1 https://github.com/creationix/nvm.git ~/.nvm

# python

# ruby

# go

# java

# nginx
sudo apt-get install nginx

# tmux
sudo apt-get install tmux

# sdkman
export SDKMAN_DIR="$dotfiles/.sdkman" && curl -s get.sdkman.io | bash

