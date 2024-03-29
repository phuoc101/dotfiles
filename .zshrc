# Enable Powerlevel10k instant prompt. Should stay close to the top of ${HOME}/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Enable colors and change prompt:
autoload -U colors && colors

# Enable calculator
autoload zcalc

setopt +o nomatch

# # Enable substitution in the prompt.
# setopt prompt_subst

# Config for the prompt. PS1 synonym.
setopt autocd

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=${HOME}/.cache/zsh/history

# Enabling zoxide
# eval "$(zoxide init zsh)"
# additional shell scripts
source_z() {
    source ${HOME}/.zsh/zsh-z/zsh-z.plugin.zsh
    autoload -U compinit
    zstyle ':completion:*' menu select
    zmodload zsh/complist
    compinit
    _comp_options+=(globdots)
}

load_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
}
load_nvm_completion() {
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# Lazy loading stuffs to speed up start time
source ${HOME}/.zsh/zsh-lazyload/zsh-lazyload.zsh
lazyload zshz -- "source_z"
lazyload pip pip3 -- 'eval "$(pip completion --zsh)"'
lazyload nvm npm node nvim nnn -- 'export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'

# Some nice zsh utils
source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ${HOME}/.zsh/zsh-highlight-config.zsh
source ${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # Include hidden files.
#
# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# More additional shell scripts
source ${HOME}/.zsh/vi-mode.zsh
source ${HOME}/.zsh/conda.zsh
source ${HOME}/.zsh/fzf-funcs.zsh
source ${HOME}/.zsh/ros-funcs.zsh
source ${HOME}/.zsh/nvim-funcs.zsh
source ${HOME}/.zsh/nnn.zsh
source ${HOME}/.zsh/zshenvs.zsh
source ${HOME}/.zsh/kitty.zsh
# # P10k prompt
source ${HOME}/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ${HOME}/.zsh/.p10k.zsh
source ${HOME}/.config/aliasrc
# # Enabling starship prompt
# eval "$(starship init zsh)"
# ## To customize prompt, run `p10k configure` or edit ${HOME}/.p10k.zsh.
# [[ ! -f ${HOME}/.p10k.zsh ]] || source ${HOME}/.p10k.zsh
# # pip autocompletion
#
# #export TERM=xerm-color
#
# source ${HOME}/.zsh/ssh.zsh
# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
ssdk() {
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
}
# FZF source
[ -f ${HOME}/.zsh/.fzf.zsh ] && source ${HOME}/.zsh/.fzf.zsh
# Rust source
[ -f "${HOME}/.cargo/env" ] && source "${HOME}/.cargo/env"
#
# For Work
[[ -e "${HOME}/.zsh/irobotics_env.zsh" ]] && source ${HOME}/.zsh/irobotics_env.zsh
