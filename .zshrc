# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable colors and change prompt:
autoload -U colors && colors

#function git_branch_name()
#{
  #branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  #if [[ $branch == "" ]];
  #then
    #:
  #else
    #echo '('$branch')'
  #fi
#}

setopt +o nomatch

# Config for prompt. PS1 synonym.
# Enabling and setting git info var to be used in prompt config.
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable git svn
## This line obtains information from the vcs.
#zstyle ':vcs_info:git*' formats "- (%b) "
#precmd() {
    #vcs_info
#}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for the prompt. PS1 synonym.
#prompt='%2/ ${vcs_info_msg_0_}> '
#prompt="%B%{$fg[red]%}%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$fg[magenta]%} in %~%{$fg[red]%} %{$reset_color%}>%b "
setopt autocd

#fzf cd
ffindf() {
   find -type f | fzf
}

ffindmulti() {
   find -type f | fzf -m
}

shareM() {
    zip _tmp.zip $(ffindmulti)
    curl -F"file=@_tmp.zip" 0x0.st
    rm _tmp.zip
}

ffinddir() {
   find -type d | fzf
}

fclipf() {
    ffindf | xclip -selection c
}

fclipdir() {
    ffinddir | xclip -selection c
}

share() {
    curl -F"file=@$(find -type f | fzf)" 0x0.st
}

fcd() {
   cd "$(ffinddir)"
}

fopen() {
   xdg-open "$(find -type f | fzf)"
}

fvim() {
   vim "$(find -type f | fzf)"
}

fsource() {
   source "$(find -type f | fzf)"
}

kopen() {
   cd /media/phuoc101/KILANBAYBAY; fopen
}

kcd() {
   cd /media/phuoc101/KILANBAYBAY; fcd
}

mcd() {
   cd /media/phuoc101/KILANBAYBAY/Masters; fcd
}

mopen() {
   cd /media/phuoc101/KILANBAYBAY/Masters; fopen
}

pcd() {
   cd /media/phuoc101/KILANBAYBAY/Projects; fcd
}

popen() {
   cd /media/phuoc101/KILANBAYBAY/Projects; fopen
}


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#conda stuffs
alias deactivate="conda deactivate"
alias open="xdg-open"
alias ls=lsd
activate() {
    source ~/anaconda3/bin/activate
}
gpu_activate() {
    activate
    conda activate gpu_tf
}


# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

source /home/phuoc101/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##source zsh themes
source ~/powerlevel10k/powerlevel10k.zsh-theme

export PATH=$PATH:/home/phuoc101/bin:/opt/gradle/gradle-6.3/bin

# source ros packages
#alias source_noetic='source /opt/ros/noetic/setup.zsh'
sros1() {
    source /opt/ros/noetic/setup.zsh
    source ~/ros1ws/devel/setup.zsh
    alias tf='cd /var/tmp && rosrun tf view_frames && evince frames.pdf &'
}

#source ros 2
sros2() {
    source /opt/ros/foxy/setup.zsh
    source ~/ros2ws/install/setup.zsh
    #export ROS_DOMAIN_ID=25
    eval "$(register-python-argcomplete3 ros2)"
    eval "$(register-python-argcomplete3 colcon)"
}
# argcomplete for ros2 & colcon

#source px4 ros2
spx4() {
    sros2
    source ~/PX4_dev/px4_ros_com_ros2/install/setup.zsh
}

#source moveit workspace
init_moveit() {
    #source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2021/moveit_proj/ws_moveit/devel/setup.zsh;
    source ~/ws_moveit/devel/setup.zsh;
}

# source turtlebot simulation ros1
init_turtlebot3_ros1() {
    source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2021/turtlebot3_rospy/catkin_ws/devel/setup.zsh;
    export TURTLEBOT3_MODEL=waffle_pi;
    export MY_MAP_PATH=/media/phuoc101/KILANBAYBAY/Projects/robot_proj_2021/turtlebot3_rospy/slam_map
}

# source turtlebot simulation ros2
init_turtlebot3_ros2() {
    source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2022/turtlebot3_ws/install/setup.zsh
    source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2022/jetbot_ws/install/setup.zsh
    export TURTLEBOT3_MODEL=waffle_pi
}

export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/media/phuoc101/KILANBAYBAY/Projects/robot_proj_2022/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models
export PATH=/usr/lib/ccache:$PATH

source /usr/share/gazebo/setup.sh
#export TERM=xerm-color

alias vim="nvim"
