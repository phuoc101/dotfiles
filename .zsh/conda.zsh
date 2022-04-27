#conda stuffs
alias deactivate="conda deactivate"
activate() {
  source ~/anaconda3/bin/activate
}
gpu_activate() {
  activate
  conda activate gpu_tf
}
