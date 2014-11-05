" otherwise NERDTree shows strange character instead of arrows
set encoding=utf-8

" vim-plug setup
if empty(glob('~/.vim/autoload/plug.vim'))
  !mkdir -p ~/.vim/autoload
  !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" General {{{
Plug 'Shougo/unite.vim'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/MatchTagAlways'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
" }}}

" colorscheme {{{
Plug 'flazz/vim-colorschemes'
" }}}

" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
" }}}

" Python {{{
Plug 'nvie/vim-flake8'
" }}}

" snippets {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}

" Unite's deps {{{
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" }}}
call plug#end()

let mapleader = "\\"

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

syntax on

" show line number
set number

" turn off backup
set nobackup
set noswapfile

" change the terminal title
set title

" highlight the current line
set cursorline

silent! colorscheme twilight256

" Indentation {{{
" use soft TAB
set expandtab
" number of visual spaces per TAB
set tabstop=2
" number of space to use for autoindenting
set shiftwidth=2
" }}}

" Git {{{
" commit message
autocmd Filetype gitcommit setlocal tw=72
" }}}

" Python {{{
autocmd Filetype python setlocal textwidth=79
autocmd Filetype python setlocal shiftwidth=4
autocmd Filetype python setlocal tabstop=4
autocmd Filetype python setlocal softtabstop=4
autocmd Filetype python setlocal shiftround
autocmd Filetype python setlocal autoindent
autocmd BufWritePost *.py call Flake8()
" }}}

" Search {{{
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap <leader>q :nohlsearch<CR>
" }}}

nmap <leader>l :setlocal number!<CR>
nmap <leader>o :set paste!<CR>

nmap <leader>d :NERDTreeToggle<CR> :NERDTreeMirror<CR>
