#!/usr/bin/zsh
#fzf functions#
ffindf() {
    fd --type f | fzf --preview="bat {} --color=always"
}

ffindfH() {
    fd -H --type f | fzf --preview="bat {} --color=always"
}

ffindmulti() { fd --type f | fzf -m --preview="bat {} --color=always"
}

shareFzM() {
    zip _tmp.zip $(ffindmulti)
    curl -F"file=@_tmp.zip" 0x0.st
    rm _tmp.zip
}

ffinddir() {
    fd --type d | fzf
}

ffinddirH() {
    fd -H --type d | fzf
}

fclipf() {
    ffindf | xclip -selection c
}

fclipdir() {
    ffinddir | xclip -selection c
}

shareFz() {
    curl -F"file=@$(fd --type f | fzf --preview="bat {} --color=always")" 0x0.st
}

fcd() {
    cd "$(ffinddir)"
}

fopen() {
    xdg-open "$(fd --type f | fzf --preview="bat {} --color=always")"
}

fvim() {
    vim "$(fd --type f | fzf --preview="bat {} --color=always")"
}

fsource() {
    source "$(fd --type f | fzf --preview="bat {} --color=always")"
}
