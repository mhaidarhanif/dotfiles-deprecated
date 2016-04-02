# Setup symbolic links

export dotfiles="$HOME/.dotfiles"

gen() {
  rm "$HOME/$1" ; ln -s "$dotfiles/$1" "$HOME/$1"
}

# bash/zsh
gen .bashrc
gen .zsh
gen .zshrc
gen .zshrc.func
gen .zshrc.server
gen .zshrc.zni
gen .aliases
gen .aliases.local

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

# .tmux
gen .tmux
gen .tmux.conf
gen .tmux.conf.local
gen .tmuxinator

# node/python/ruby
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
export SDKMAN_DIR="$dotfiles/.sdkman" && curl -s get.sdkman.io | bash
gen .sdkman

