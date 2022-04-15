call plug#begin()
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim'
Plug 'sainnhe/sonokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'ayu-theme/ayu-vim' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"" basics
"let g:sonokai_style = 'default'
"let g:sonokai_enable_italic=0
"let g:sonokai_disable_italic_comment=1
"colorscheme sonokai
"let g:lightline.colorscheme = 'sonokai'
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
set mouse=a
syntax enable
let mapleader="`" 
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
xnoremap E $
xnoremap B ^
set pastetoggle=<leader>P
let python_highlight_all=1
syntax on


"cursor config
let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[ q"  " default cursor (usually blinking block) otherwise

"NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint', 'flake8']

"gundo
if has('python3')
   let g:gundo_prefer_python3 = 1
endif
nnoremap <C-g> :GundoToggle<CR>

"launch file syntax highlighting
augroup launch
  au!
  autocmd BufNewFile,BufRead *.launch  set syntax=xml
augroup END
