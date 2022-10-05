#fzf functions#
ffindf() {
  fdfind --type f | sk --preview="bat {} --color=always"
}

ffindmulti() {
  fdfind --type f | sk -m --preview="bat {} --color=always"
}

shareFzM() {
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

shareFz() {
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
  cd /media/phuoc101/imaunicorn; fopen
}

kcd() {
  cd /media/phuoc101/imaunicorn; fcd
}

mcd() {
  cd $MASTERS_DIR; fcd
}

mopen() {
  cd $MASTERS_DIR; fopen
}

pcd() {
  cd $PROJECTS_DIR; fcd
}

popen() {
  cd $PROJECTS_DIR; fopen
}
