if [[ ! "$PATH" == */home/phuoc101/sys_tools/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/phuoc101/sys_tools/fzf/bin"
fi

source <(fzf --zsh)
