set mouse=a
syntax enable
let mapleader=" " 
set timeoutlen=500
set encoding=utf-8
set nu rnu
filetype plugin indent on
set ts=4
set sw=4
set sts=4
set expandtab
set showcmd
set cursorline
hi CursorLine ctermbg=DarkGray term=bold cterm=bold guibg=Grey70
set wildmenu   "autocomplete for cmd menu
set lazyredraw   "redraw only when needed
set showmatch    "highlight [{()}]
set incsearch	"search as characters are entered
set hlsearch	"highlight search
"turn off search highlight
nnoremap <leader><leader> :nohlsearch<CR> 

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
xnoremap E $
xnoremap B ^
"navigate split screen
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let python_highlight_all=1
syntax on
set clipboard+=unnamedplus
