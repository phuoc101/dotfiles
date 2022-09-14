#conda stuffs
alias deactivate_conda="conda deactivate"

activate_conda() {
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/home/phuoc101/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/phuoc101/anaconda3/etc/profile.d/conda.sh" ]; then
          . "/home/phuoc101/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="/home/phuoc101/anaconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
}

sbase_conda_path() {
  export PYTHONPATH=$PYTHONPATH:/home/phuoc101/anaconda3/lib/python3.9/site-packages
}

activate_tf_gpu() {
  activate_conda
  conda activate tf_gpu
}

stf_gpu_conda_path() {
  export PYTHONPATH=$PYTHONPATH:/home/phuoc101/anaconda3/envs/tf_gpu/lib/python3.10/site-packages
}

activate_label_studio() {
  activate_conda
  conda activate label-studio
}

slabel_studio_conda_path() {
  export PYTHONPATH=$PYTHONPATH:/home/phuoc101/anaconda3/envs/label-studio/lib/python3.7/site-packages
}
