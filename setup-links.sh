#!/usr/bin/env zsh

# Setup symbolic links

export dotfiles="$HOME/.dotfiles"

gen() {
  rm "$HOME/$1" ; ln -s "$dotfiles/$1" "$HOME/$1"
}

# bash/zsh
gen .bashrc
gen .zprezto
gen .zsh
gen .zshrc
gen .zshrc.func
gen .zshrc.server
gen .zplug
gen .aliases
gen .aliases.local
gen .fzf.zsh

# vim/atom
gen .vim
gen .vimrc
gen .vimrc.plugs
gen .vimrc.snippets
gen .nvim
gen .nvimrc
gen .gvimrc
rm .vim/init.vim ; ln -s ~/.dotfiles/.vimrc .vim/init.vim
gen .atom

# git
gen .gitconfig
gen .gitignore
gen .gitmessage
gen .gitattributes

# .tmux
gen .tmux
gen .tmux.conf
gen .tmux.conf.local
gen .tmuxinator

# brew/asdf/node/python/ruby
gen .linuxbrew
gen .asdf
gen .nvm
gen .npm
gen .npmrc
gen .pyenv
gen .rbenv
gen .gemrc

# android
gen .android-developer-toolkit 
gen .android-studio

# extras
gen .bin
gen .agignore
gen .curlrc
gen .linuxbrew
gen .rcrc
gen .fonts.conf
gen .psqlrc

# sdkman
gen .sdkman

