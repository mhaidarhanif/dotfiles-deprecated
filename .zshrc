# ======================
# Main ZSH configuration
# ======================

# Path to ZSH installation
export ZSH=$HOME/.dotfiles/zsh

zstyle ':completion:*' menu select
zstyle :compinstall filename '$HOME/.zshrc'

setopt completealiases
setopt HIST_IGNORE_DUPS

autoload -Uz compinit
compinit

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="agnoster"
export TERM="xterm-256color"
# Base16 Shell
# BASE16_SHELL="$HOME/.dotfiles/base16-shell/base16-default.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/custom

# --------------------
# Plugins with Antigen
source ~/.dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
# antigen bundle command-not-found
# antigen bundle git
# antigen bundle heroku
# antigen bundle pip
# antigen bundle lein
# antigen theme themename
# antigen theme gitsome
# antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src
antigen bundle sdurrheimer/docker-compose-zsh-completion

antigen apply # Tell antigen that you're done.

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  autojump
  bower
  bundler
  brew
  # common-aliases
  # debian
  dircycle
  gas
  gem
  npm
  # git
  # gitfast
  # git-extras
  # git-flow-avh
  # git-flow-completion
  # git-hubflow
  # jsontools
  # zsh-syntax-highlighting
  zsh-history-substring-search
)

# Syntax highlighting config
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(
  main
  brackets
  pattern
)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

source $ZSH/oh-my-zsh.sh

# ==================
# User configuration
# ==================

export PATH=".git/safe/../../bin:~/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# ---

# set title automatically
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%.\a"}
    ;;
esac

# ------------
# Prompt & Git
# ------------

# git-radar
export PATH="$PATH:$HOME/.dotfiles/git-radar"

# git-subrepo
export GIT_SUBREPO_DIR="$HOME/.dotfiles/git-subrepo"
fpath=("$GIT_SUBREPO_DIR/share/zsh-completion" $fpath)
source $GIT_SUBREPO_DIR/init

# git-hub
export GIT_HUB_DIR="$HOME/.dotfiles/git-hub"
fpath=("$GIT_HUB_DIR/share/zsh-completion" $fpath)
source $GIT_HUB_DIR/init

# zsh-prompt (if no theme is activated)
#setopt promptsubst
# export PS1="%~ %{%(#~$fg[red]~$fg[blue])%}%#%{$fg[default]%} "
#export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%} %#'
#export NEWLINE=$'\n'
#export PROMPT="$PROMPT\$(git-radar --zsh --fetch) "

# zsh-prompt-char
function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  echo '$'
}

# git-branch function
function git_branch {
  BRANCH="$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)"
  if ! test -z $BRANCH; then
    COL="%{$fg[green]%}" # Everything's fine
    [[ $(git log origin/master..HEAD 2> /dev/null ) != "" ]] && COL="%{$fg[blue]%}" # We have changes to push
    [[ $(git status --porcelain 2> /dev/null) != "" ]] && COL="%{$fg[red]%}" # We have uncommited changes
    echo "$COL$BRANCH"
  fi
}

# ------
# Extras
# ------

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=9999
bindkey -v

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
# bindkey -v
# bindkey "^F" vi-cmd-mode
# bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# search keybindings
# ------------------

# bind UP and DOWN arrow keys
# zmodload zsh/terminfo
# bindkey '^[OA' history-substring-search-up
# bindkey '^[OB' history-substring-search-down

# bind P and N for EMACS mode
# bindkey -M emacs '^P' history-substring-search-up
# bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down

bindkey '^[OA' up-line-or-search
bindkey '^[OB' down-line-or-search

bindkey '^[OA' history-search-backward
bindkey '^[OB' history-search-forward

bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# load thoughtbot/dotfiles scripts
export PATH="$PATH:$HOME/.bin"

# mkdir .git/safe in the root of repositories you trust
export PATH="$PATH:.git/safe/../../bin"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Functions
[[ -f ~/.zshrc.func ]] && source ~/.zshrc.func

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ------------------------------------------------------------
# All binaries
# ------------------------------------------------------------
export PATH="$PATH:$HOME/.bin"

# ------------------------------------------------------------
# Linuxbrew
# A fork of Homebrew for Linux
# ------------------------------------------------------------
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# ------------------------------------------------------------
# Butler
# Remembers those project specific long commands
# ------------------------------------------------------------
export PATH="$PATH:$HOME/.bin/butler"
source "$(butler --init-completion)"

# ------------------------------------------------------------
# NVM
# Node Version Manager
# ------------------------------------------------------------

export NVM_DIR=$(readlink -f "$HOME/.nvm")
# Primary source, this loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
export NVM_SYMLINK_CURRENT=false

# Activate when want to be separated with sudo version
# [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
# export NVM_BIN="$NVM_DIR/current/bin"
# export PATH="$PATH:$NVM_DIR"
# alias npm="$NVM_BIN/npm"
# alias node="$NVM_BIN/node"

# source "$NVM_DIR/current/lib/node_modules/npm/lib/utils/completion.sh"

# ------------------------------------------------------------
# DNVM
# .NET Version Manager
# ------------------------------------------------------------

[ -s "$HOME/.dnx/dnvm/dnvm.sh" ] && . "$HOME/.dnx/dnvm/dnvm.sh"

# ------------------------------------------------------------
# pyenv: Python Environment
# Python Anaconda
# ------------------------------------------------------------
export PYENV_DIR=$(readlink -f "$HOME/.pyenv")
export PATH="$PATH:$PYENV_DIR/bin/"
eval "$(pyenv init -)"
# python anaconda version
# export PATH="$HOME/anaconda/bin:$PATH"

# ------------------------------------------------------------
# rbenv
# ------------------------------------------------------------
export RBENV_DIR=$(readlink -f "$HOME/.rbenv")
export PATH="$PATH:$RBENV_DIR/bin/"
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# ------------------------------------------------------------
# Swift
# ------------------------------------------------------------
#export SWIFT_DIR="$HOME/.swift"
#export PATH="$PATH:$SWIFT_DIR/usr/bin"

# ------------------------------------------------------------
# Docker
# ------------------------------------------------------------
#export DOCKER_DIR="$HOME/.docker"

# ------------------------------------------------------------
# Java
# ------------------------------------------------------------
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
export PATH="$PATH:$HOME/bin:$JAVA_HOME/bin"
export JAVA_HOME
export JRE_HOME

# ------------------------------------------------------------
# IntelliJ IDEA
# ------------------------------------------------------------
export IDEA_CONFIG="$HOME/.IdeaIC14"
export IDEA_HOME="$HOME/all/app/ide/intellij-idea/idea-IC"
export PATH="$PATH:$IDEA_HOME/bin"

# ------------------------------------------------------------
# Android Resources
# Android SDK
# Android Studio
# Genymotion
# ------------------------------------------------------------
export ADT_DIR="$HOME/.android-developer-toolkit/"
export ANDROID_HOME="$ADT_DIR/sdk/"
export ANDROIDSDK_DIR="$ANDROID_HOME"
export ANDROIDSTUDIO_DIR="$HOME/.android-studio/"

export PATH="$PATH:$ANDROIDSTUDIO_DIR/bin/"
export PATH="$ADT_DIR/sdk/tools:$PATH"
export PATH="$ADT_DIR/sdk/platforms:$PATH"
# export PATH="$ADT_DIR/sdk/build-tools:$PATH"

export PATH="$HOME/.android/genymotion:$PATH"

# ------------------------------------------------------------
# PostgreSQL
# ------------------------------------------------------------
export PGHOST=localhost

# ------------------------------------------------------------
# Eclipse
# ------------------------------------------------------------
export ECLIPSE_DIR="$HOME:.eclipse/"

# ------------------------------------------------------------
# Heroku
# ------------------------------------------------------------
# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# ------------------------------------------------------------
# Telegram
# ------------------------------------------------------------
export PATH="~/.telegram/bin:$PATH"

# Fuzzy file finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###-tns-completion-start-###
if [ -f $HOME/.tnsrc ]; then 
    source $HOME/.tnsrc 
fi
###-tns-completion-end-###

# ------------------------------------------------------------
# SDKMAN!
# ------------------------------------------------------------

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ------------------------------------------------------------
# ASDF
# ------------------------------------------------------------
source $HOME/.asdf/asdf.sh
# source $HOME/.asdf/completions/asdf.bash

# antibody >= antigen
source <(antibody init)

