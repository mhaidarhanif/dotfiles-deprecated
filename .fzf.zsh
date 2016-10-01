# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/mhaidarh/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/mhaidarh/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/mhaidarh/.fzf/man* && -d "/Users/mhaidarh/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/mhaidarh/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/mhaidarh/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/mhaidarh/.fzf/shell/key-bindings.zsh"

