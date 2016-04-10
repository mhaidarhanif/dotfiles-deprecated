#
# Executes commands at the start of an interactive session.
#

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize all configin separated files
# Except for some

# ------------------------------------------------------------
# Fuzzy file finder
# ------------------------------------------------------------

# Install via zplug firsit
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[[ -f "$HOME/.tnsrc" ]] && source "$HOME/.tnsrc"

