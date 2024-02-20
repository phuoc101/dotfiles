#!/bin/bash

export CUDA_VER=11.8
export PATH=/usr/local/cuda-${CUDA_VER}/bin:$PATH
export PATH=/home/phuoc/.local:$PATH
export PATH=$HOME/.cargo/bin/:$PATH
export EDITOR='vim'
export LD_LIBRARY_PATH=/usr/local/cuda-${CUDA_VER}/targets/x86_64-linux/lib:/usr/local/cuda-${CUDA_VER}/lib64:$LD_LIBRARY_PATH

conceptgraphs_envs() {
    export CG_FOLDER=/home/phuoc101/irobotics/projects/ml_prj/vlm/conceptgraphs

    export AM_I_DOCKER=False
    export BUILD_WITH_CUDA=True
    export CUDA_HOME=/usr/local/cuda-${CUDA_VER}

    export GSA_PATH=${CG_FOLDER}/Grounded-Segment-Anything

    export LLAVA_PYTHON_PATH=${CG_FOLDER}/LLaVA/llava
    export LLAVA_MODEL_PATH=${CG_FOLDER}/LLaVA/llava-v1.5-7b

    export REPLICA_ROOT=${CG_FOLDER}/Datasets/Replica
    export REPLICA_CONFIG_PATH=${CG_FOLDER}/concept-graphs/conceptgraph/dataset/dataconfigs/replica/replica.yaml
}
