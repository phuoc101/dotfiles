# Setup fzf
# ---------
if [[ ! "$PATH" == *${HOME}/sys_tools/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}${home}/sys_tools/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/sys_tools/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/sys_tools/fzf/shell/key-bindings.zsh"
