gpustats() {
  watch -n0.1 nvidia-smi
}

which_term(){
  xprop -id $WINDOWID WM_CLASS | cut -d" " -f3 | sed 's/^.\(.*\)..$/\1/'
}

if [ $(which_term) == "kitty" ] 
then
  alias ssh="kitty +kitten ssh"
fi
