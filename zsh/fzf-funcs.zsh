#fzf functions#
ffindf() {
  find -type f | fzf
}

ffindmulti() {
  find -type f | fzf -m
}

shareM() {
  zip _tmp.zip $(ffindmulti)
  curl -F"file=@_tmp.zip" 0x0.st
  rm _tmp.zip
}

ffinddir() {
  find -type d | fzf
}

fclipf() {
  ffindf | xclip -selection c
}

fclipdir() {
  ffinddir | xclip -selection c
}

share() {
  curl -F"file=@$(find -type f | fzf)" 0x0.st
}

fcd() {
  cd "$(ffinddir)"
}

fopen() {
  xdg-open "$(find -type f | fzf)"
}

fvim() {
  vim "$(find -type f | fzf)"
}

fsource() {
  source "$(find -type f | fzf)"
}

kopen() {
  cd /media/phuoc101/KILANBAYBAY; fopen
}

kcd() {
  cd /media/phuoc101/KILANBAYBAY; fcd
}

mcd() {
  cd /media/phuoc101/KILANBAYBAY/Masters; fcd
}

mopen() {
  cd /media/phuoc101/KILANBAYBAY/Masters; fopen
}

pcd() {
  cd /media/phuoc101/KILANBAYBAY/Projects; fcd
}

popen() {
  cd /media/phuoc101/KILANBAYBAY/Projects; fopen
}
