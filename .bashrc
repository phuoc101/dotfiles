# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
#export TERM=xterm-color

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}$(tput bold)\]\[\033[38;5;11m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] '
    PS1='${debian_chroot:+($debian_chroot)}\[$(tput bold)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;45m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\] \[$(tput sgr0)\]'
    PS1+="\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "



else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/phuoc101/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
    #eval "$__conda_setup"
#else
    #if [ -f "/home/phuoc101/anaconda3/etc/profile.d/conda.sh" ]; then
        #. "/home/phuoc101/anaconda3/etc/profile.d/conda.sh"
    #else
        #export PATH="/home/phuoc101/anaconda3/bin:$PATH"
    #fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

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
accel_activate() {
    activate
    conda activate accel
}

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

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

export PATH=$PATH:/home/phuoc101/bin:/opt/gradle/gradle-6.3/bin

# source ros packages
#alias source_noetic='source /opt/ros/noetic/setup.zsh'
sros1() {
    source /opt/ros/noetic/setup.sh
    source ~/ros1ws/devel/setup.sh
    alias tf='cd /var/tmp && rosrun tf view_frames && evince frames.pdf &'
}

#source ros 2
sros2() {
    source /opt/ros/foxy/setup.sh
    source ~/ros2ws/install/setup.sh
    export ROS_DOMAIN_ID=25
    eval "$(register-python-argcomplete3 ros2)"
    eval "$(register-python-argcomplete3 colcon)"
}
# argcomplete for ros2 & colcon

#source px4 ros2
spx4() {
    source ~/PX4_dev/px4_ros_com_ros2/src/px4_ros_com/install/setup.bash
}

#source moveit workspace
init_moveit() {
    #source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2021/moveit_proj/ws_moveit/devel/setup.zsh;
    source ~/ws_moveit/devel/setup.sh;
}

init_turtlebot3_ros1() {
    source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2021/turtlebot3_rospy/catkin_ws/devel/setup.sh;
    export TURTLEBOT3_MODEL=waffle_pi;
    export MY_MAP_PATH=/media/phuoc101/KILANBAYBAY/Projects/robot_proj_2021/turtlebot3_rospy/slam_map
}

init_turtlebot3_ros2() {
    source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2022/turtlebot3_ws/install/setup.sh
    source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2022/jetbot_ws/install/setup.sh
    export TURTLEBOT3_MODEL=waffle_pi
}

export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/media/phuoc101/KILANBAYBAY/Projects/robot_proj_2022/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models
export PATH=/usr/lib/ccache:$PATH

source /usr/share/gazebo/setup.sh

# auto cd
shopt -s autocd
# auto complete
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
# vi mode
set -o vi

#source ~/.bash-powerline.sh
export FASTRTPSGEN_DIR="/usr/local"
