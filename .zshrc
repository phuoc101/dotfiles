# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
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
HISTFILE=~/.cache/zsh/history

# additional shell scripts
# Enabling zoxide
# eval "$(zoxide init zsh)"
source ~/.zsh/zsh-z/zsh-z.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-highlight-config.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

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
source ~/.zsh/vi-mode.zsh
source ~/.zsh/conda.zsh
source ~/.zsh/fzf-funcs.zsh
source ~/.zsh/ros-funcs.zsh
source ~/.zsh/nvim-funcs.zsh
source ~/.zsh/nnn.zsh
source ~/.zsh/zshenvs.zsh
source ~/.zsh/sys-funcs.zsh
source ~/.zsh/kitty.zsh
# # P10k prompt
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/.p10k.zsh
source ~/.config/aliasrc
# # Enabling starship prompt
# eval "$(starship init zsh)"
# ## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# # pip autocompletion
# eval "$(pip completion --zsh)"
#
# #export TERM=xerm-color
#
source ~/.zsh/ssh.zsh
# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
ssdk() {
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
}

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_LAZY_LOAD=true
source ~/.zsh/zsh-nvm/zsh-nvm.plugin.zsh
# source ~/.zsh/zsh-lazyload/zsh-lazyload.zsh
