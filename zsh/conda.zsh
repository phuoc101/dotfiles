#conda stuffs
alias deactivate_conda="conda deactivate"

activate_conda() {
  source ~/anaconda3/bin/activate
}

sbase_conda_path() {
  export PYTHONPATH=$PYTHONPATH:/home/phuoc10/anaconda3/lib/python3.9/site-packages
}

activate_tf_gpu() {
  activate_conda
  conda activate tf_gpu
}

stf_gpu_conda_path() {
  export PYTHONPATH=$PYTHONPATH:/home/phuoc10/anaconda3/envs/tf_gpu/lib/python3.10/site-packages
}

activate_label_studio() {
  activate_conda
  conda activate label-studio
}

slabel_studio_conda_path() {
  export PYTHONPATH=$PYTHONPATH:/home/phuoc10/anaconda3/envs/label-studio/lib/python3.7/site-packages
}
