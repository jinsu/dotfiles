" vim:foldmethod=marker:foldlevel=0

" Colors {{{
set t_Co=256
set background=dark
colorscheme desert
" }}}

" Misc Vim Config {{{
syntax on " enable syntax processing
set autoindent " indent to the previous line's indentation on newline
set title " Show filename in the window titlebar
set wildmenu " visual autocomplete for command menu
set encoding=utf-8
set backspace=indent,eol,start "backspace through newlines
set clipboard=unnamed " let osx access system clipboard
set directory=~/.vim/tmp/swap// " set swap directory. two slashes at the end ensures complete file path to avoid name collision.
set backupdir=~/.vim/tmp/backup// " set backup directory.
set undodir=~/.vim/tmp/undo// " set undo directory
" autocmd BufEnter * lcd %:p:h " sets working dir to current dir
" }}}

" Spaces & Tabs {{{
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2  " number of spaces when re-indenting
set expandtab " tabs are spaces
" }}}

" search {{{
set incsearch " show matching search as you type
set hlsearch " highlight matches
set ignorecase " combine with smartcase for smarter ignore case
set smartcase " case-sensitive if all lowercase, case-insensitive if contains uppercase
" }}}

" UI Layout {{{
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " hightlight current line
set lazyredraw " redraw only when we need to.
set showmatch " highlight matching [{()}]
set colorcolumn=80 " highlight text beyond 80 chars
set ttyfast " indicates a fast terminal connection, faster redraw
set nowrap " no line breaking
" }}}

" Folding {{{
set foldenable " enable folding
set foldlevelstart=10 " open fold level to 10 by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent "fold based on indent level
" }}}

" Filetype {{{
filetype plugin indent on " load filetype-specific files

" Python {{{
au BufNewFile,BufRead *.py 
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix
let python_highlight_all=1

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
" }}}

" js, html, css, scss files {{{
au BufNewFile,BufRead *.js,*.html,*.css,*.scss,*.yml
    \ set tabstop=2 | 
    \ set softtabstop=2 |
    \ set shiftwidth=2
" }}}

" vimrc {{{
autocmd bufwritepost .vimrc source $MYVIMRC
" }}}

" }}}

" Leader Shortcuts {{{
let mapleader="," "leader is comma

" turn off search highlight to ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" space open/closes folds
" nnoremap <space> za

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" save vim session
nnoremap <leader>s :mksession! ~/.vim/.vim_session<CR> 
" load vim session
nnoremap <leader>w :source ~/.vim/.vim_session<CR>
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'scrooloose/syntastic'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/indentpython.vim', { 'for': ['python'] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'

call plug#end()
" }}}

" Plugin Enhancements {{{

" seoul colors {{{
colorscheme seoul256

" seoul256 (dark):
" "   Range:   233 (darkest) ~ 239 (lightest)
" "   Default: 237

let g:seoul256_background = 238
" }}}

" nerdtree {{{
  " open up nerd tree with ,n with current dir as the working dir ( % symbol) 
  nnoremap <leader>t :NERDTreeToggle %<CR>
  nnoremap <leader>f :NERDTreeFind<CR>

  let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore files in NERDTree
"}}}

" syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1 " aggregate all errors to one list
let g:syntastic_javascript_checkers = ['eslint', 'flow', 'jslint']
let g:syntastic_python_checkers = ['python', 'flake8'] 
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-'] 
" }}}

" airline {{{
set laststatus=2
" }}}

" fugitive {{{
set statusline=%{fugitive#statusline()}
" }}}

"}}}
