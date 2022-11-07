i3config ()
{
  nvim ~/.config/i3/config +":setfiletype config"
}

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

reset_picom() {
  killall picom xborders
  picom &
  ~/sys_tools/xborder/xborders -c ~/.config/xborder/config.json
}

reset_dunst() {
  killall dunst
  dunst &
}
