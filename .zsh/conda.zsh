#conda stuffs
alias c_deactivate="conda deactivate"

c_activate() {
  source ~/anaconda3/bin/activate
}

c_gpu_activate() {
  c_activate
  conda activate gpu_tf
}
