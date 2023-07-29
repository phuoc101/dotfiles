# Setup fzf
# ---------
if [[ ! "$PATH" == */home/phuoc101/sys_tools/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/phuoc101/sys_tools/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/phuoc101/sys_tools/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/phuoc101/sys_tools/fzf/shell/key-bindings.zsh"
