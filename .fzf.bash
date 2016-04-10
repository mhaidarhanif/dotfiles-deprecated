# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mhaidarh/.fzf/bin* ]]; then
  export PATH="$PATH:/home/mhaidarh/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/mhaidarh/.fzf/man* && -d "/home/mhaidarh/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/mhaidarh/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mhaidarh/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/mhaidarh/.fzf/shell/key-bindings.bash"

