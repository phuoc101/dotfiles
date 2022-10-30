# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Enable colors and change prompt:
autoload -U colors && colors

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
source ~/.zsh/zsh-z/zsh-z.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-highlight-config.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # Include hidden files.

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# More additional shell scripts
source ~/.zsh/vi-mode.sh
source ~/.zsh/conda.sh
source ~/.zsh/fzf-funcs.sh
source ~/.zsh/ros-funcs.sh
source ~/.zsh/nvim-funcs.sh
source ~/.zsh/nnn.sh
source ~/.zsh/zshenvs.sh
source ~/.zsh/sysinfo.sh
source ~/.zsh/kitty.sh
# # P10k prompt
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/.p10k.zsh
source ~/.config/aliasrc
# # Enabling starship prompt
# eval "$(starship init zsh)"
# ## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.sh ] && source ~/.fzf.sh

#export TERM=xerm-color

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

source ~/.zsh/ssh.sh
