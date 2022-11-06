#conda stuffs
alias deactivate_conda="conda deactivate"

activate_conda() {
  source ~/.zsh/conda-zsh-completion/conda-zsh-completion.plugin.zsh
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
  compinit conda
}

sbase_conda_path() {
  export PYTHONPATH=$PYTHONPATH:/home/phuoc101/anaconda3/lib/python3.9/site-packages
}

stf_gpu_conda_path() {
  export PYTHONPATH=$PYTHONPATH:/home/phuoc101/anaconda3/envs/tf_gpu/lib/python3.9/site-packages
  
}

storch_conda_path() {
  export PYTHONPATH=$PYTHONPATH:/home/phuoc101/anaconda3/envs/pytorch/lib/python3.8/site-packages
  
}
