#!/usr/bin/zsh
export PATH=$PATH:/home/phuoc101/.local/bin:/opt/gradle/gradle-6.3/bin
export PATH=/usr/lib/ccache:$PATH
export PATH=/usr/local/cuda-11.3/bin:$PATH
export EDITOR='nvim'
export VISUAL='nvim'
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/media/phuoc101/imaunicorn/Projects/robot_proj_2022/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models
export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export CPATH=/usr/local/cuda-11.3/targets/x86_64-linux/include:$CPATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.3/targets/x86_64-linux/lib:/usr/local/cuda-11.3/lib64:$LD_LIBRARY_PATH
ZSH_DISABLE_COMPFIX=true
# kitty themes
export KITTY_DARK_THEME=Afterglow
export KITTY_LIGHT_THEME=papercolor-light
# unreal engine
export UE4_ROOT=~/UnrealEngine_4.26
# dirs shortcuts
export DOTFILES_DIR=/media/phuoc101/imaunicorn/backup/linux_setups/dotfiles
export DATASETS_CV_DIR=/media/phuoc101/imaunicorn/projects/computer_vision/datasets
export MASTERS_DIR=/media/phuoc101/imaunicorn/masters
export PROJECTS_DIR=/media/phuoc101/imaunicorn/projects
export OBSIDIAN_DIR=/media/phuoc101/imaunicorn/backup/obsidian
export ALACRITTY_DIR=/home/phuoc101/.config/alacritty
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion