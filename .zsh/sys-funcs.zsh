i3config ()
{
  nvim ~/.config/i3/config +":setfiletype config"
}

gpustats() {
  watch -n0.1 nvidia-smi
}

which_term(){
  basename "/"$(ps -o cmd -f -p $(cat /proc/$(echo $$)/stat | cut -d \  -f 4) | tail -1 | sed 's/ .*$//')
}

reset_picom() {
  killall picom xborders
  picom &
  ~/sys_tools/xborder/xborders -c ~/.config/xborder/config.json
}

reset_dunst() {
  killall dunst
  dunst &
}
