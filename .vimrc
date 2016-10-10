" vim:foldmethod=marker:foldlevel=0

" Colors {{{
set t_Co=256
set background=dark
colorscheme desert
" }}}

" Misc Vim Config {{{
syntax on " enable syntax processing
set autoindent
set title " Show filename in the window titlebar
set wildmenu " visual autocomplete for command menu
set encoding=utf-8
set incsearch " show matching search as you type
set backspace=indent,eol,start "backspace through newlines
set clipboard=unnamed " let osx access system clipboard
" }}}

" Spaces & Tabs {{{
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2  " number of spaces when re-indenting
set expandtab " tabs are spaces
" }}}

" UI Layout {{{
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " hightlight current line
set lazyredraw " redraw only when we need to.
set showmatch " highlight matching [{()}]
set colorcolumn=80 " highlight text beyond 80 chars
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
      \ set tabstop=4
      \ set softtabstop=4
      \ set shiftwidth=4
      \ set expandtab
      \ set autoindent
      \ set fileformat=unix
let python_highlight_all=1
" }}}

" js, html, css, scss files {{{
au BufNewFile,BufRead *.js, *.html, *.css, *.scss, *.yml
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
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

" save session
nnoremap <leader>s :mksession<CR>
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
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim', { 'for': ['python'] }

call plug#end()
" }}}

" Plugin Enhancements {{{

" Seoul Colors {{{
colorscheme seoul256
" }}}

" NerdTree {{{
  " open up nerd tree with ,n
  nnoremap <leader>n :NERDTreeToggle<CR>

  let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore files in NERDTree
"}}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint', 'flow', 'jslint']
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-'] 
" }}}

" Vim-Flake8 {{{
autocmd BufWritePost *.py call Flake8() " call flake 8 on save
" }}}

" Git-Fugitive {{{
set statusline=%{fugitive#statusline()}
" }}}

"}}}
