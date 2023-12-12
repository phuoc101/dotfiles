#!/usr/bin/zsh
export PATH=$PATH:/home/phuoc101/.local/bin:/opt/gradle/gradle-6.3/bin
export PATH=/usr/lib/ccache:$PATH
export PATH=~/go/bin:/usr/local/go/bin:$PATH
export CUDA_VER=11.8
export PATH=/usr/local/cuda-${CUDA_VER}/bin:$PATH
export EDITOR='nvim'
export VISUAL='nvim'
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/media/phuoc101/imaunicorn/Projects/robot_proj_2022/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models
export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export CPATH=/usr/local/cuda-${CUDA_VER}/targets/x86_64-linux/include:$CPATH
export LD_LIBRARY_PATH=/usr/local/cuda-${CUDA_VER}/targets/x86_64-linux/lib:/usr/local/cuda-${CUDA_VER}/lib64:$LD_LIBRARY_PATH
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
conceptgraphs_envs() {
    export CG_FOLDER=/home/phuoc101/irobotics/projects/ml_prj/vlm/conceptgraphs

    export AM_I_DOCKER=False
    export BUILD_WITH_CUDA=True
    export CUDA_HOME=/usr/local/cuda-${CUDA_VER}

    export GSA_PATH=${CG_FOLDER}/Grounded-Segment-Anything

    export LLAVA_PYTHON_PATH=${CG_FOLDER}/LLaVA/llava
    export LLAVA_MODEL_PATH=${CG_FOLDER}/LLaVA/LLaVA-7b-delta-v0

    export REPLICA_ROOT=${CG_FOLDER}/Datasets/Replica
    export REPLICA_CONFIG_PATH=${CG_FOLDER}/concept-graphs/conceptgraph/dataset/dataconfigs/replica/replica.yaml
}
# AALTO SERVERS
export GUNDAM_IP=130.233.123.198
export MARVIN_IP=130.233.123.196
