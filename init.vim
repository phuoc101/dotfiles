call plug#begin()
"code helper
Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"latex
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"formattings
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
"utilities
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-webdevicons'
call plug#end()

set termguicolors     " enable true colors support
colorscheme onedark
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
set mouse=a
syntax enable
let mapleader="\\" 
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
set ruler
set wildmenu   "autocomplete for cmd menu
set lazyredraw   "redraw only when needed
set showmatch    "highlight [{()}]
set incsearch	"search as characters are entered
set hlsearch	"highlight search
"turn off search highlight
nnoremap <space> :nohlsearch<CR> 

set foldlevelstart=9
set foldnestmax=9
set foldmethod=indent   "fold base on indent level
noremap <leader><space> za
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
xnoremap j gj
xnoremap k gk
xnoremap E $
xnoremap B ^
set pastetoggle=<leader>P
let python_highlight_all=1
syntax on

"NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"gundo
if has('python3')
   let g:gundo_prefer_python3 = 1
endif
nnoremap <C-g> :GundoToggle<CR>

"launch file syntax highlighting
"augroup launch
  "au!
  "autocmd BufNewFile,BufRead *.launch  set syntax=xml
"augroup END

let g:livepreview_previewer = 'zathura'
let g:tex_flavor = 'latex'

"""
"vimtex
""""
let g:vimtex_view_method = 'zathura'
map <F3> :Autoformat<CR>

"""
"easymotion
"""
map <Leader> <Plug>(easymotion-prefix)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

let $FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name ''*.tags'' -printf ''%P\n'''
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

"""
" COC Config
"""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

map <C-s> :noa w<CR>
