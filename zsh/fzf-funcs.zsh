#fzf functions#
ffindf() {
  fdfind --type f | sk --preview="bat {} --color=always"
}

ffindmulti() {
  fdfind --type f | sk -m --preview="bat {} --color=always"
}

shareM() {
  zip _tmp.zip $(ffindmulti)
  curl -F"file=@_tmp.zip" 0x0.st
  rm _tmp.zip
}

ffinddir() {
  fdfind --type d | sk
}

fclipf() {
  ffindf | xclip -selection c
}

fclipdir() {
  ffinddir | xclip -selection c
}

share() {
  curl -F"file=@$(fdfind --type f | sk --preview="bat {} --color=always")" 0x0.st
}

fcd() {
  cd "$(ffinddir)"
}

fopen() {
  xdg-open "$(fdfind --type f | sk --preview="bat {} --color=always")"
}

fvim() {
  vim "$(fdfind --type f | sk --preview="bat {} --color=always")"
}

fsource() {
  source "$(fdfind --type f | sk --preview="bat {} --color=always")"
}

kopen() {
  cd /media/phuoc10/imaunicorn; fopen
}

kcd() {
  cd /media/phuoc10/imaunicorn; fcd
}

mcd() {
  cd /media/phuoc10/imaunicorn/masters; fcd
}

mopen() {
  cd /media/phuoc10/imaunicorn/masters; fopen
}

pcd() {
  cd /media/phuoc10/imaunicorn/projects; fcd
}

popen() {
  cd /media/phuoc10/imaunicorn/projects; fopen
}
