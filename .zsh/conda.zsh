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
