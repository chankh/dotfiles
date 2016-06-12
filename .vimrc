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
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
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

" Go {{{
Plug 'fatih/vim-go'
Plug 'vim-jp/vim-go-extra'
" }}}

" snippets {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}

" Unite's deps {{{
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
" }}}

" tmux {{{
Plug 'edkolev/tmuxline.vim'
" }}}

call plug#end()

" Leader - ( Spacebar )
let mapleader = " "

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

syntax on

" show line number
set number
set relativenumber

turn off backup
set nobackup
set noswapfile

" change the terminal title
set title

" highlight the current line
set cursorline

" stop that ANNOYING beeping
set visualbell

silent! colorscheme Tomorrow-Night-Eighties

" Indentation {{{
" use soft TAB
set expandtab
" number of visual spaces per TAB
set tabstop=4
" number of space to use for autoindenting
set shiftwidth=4
" }}}

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Automatically :write before running commands
set autowrite

" Reload files changed outside vim
set autoread

" Make it obvious where 100 character is
set textwidth=100
set colorcolumn=+1

" Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

" Quick window movements
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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
set gdefault
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
" Stop highlight after searching
nnoremap <silent> <leader>, :noh<cr>
nmap <leader>q :nohlsearch<CR>
" }}}

nmap <leader>l :setlocal number!<CR>
nmap <leader>o :set paste!<CR>

nmap <leader>d :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" Go {{{
autocmd Filetype go setlocal noexpandtab
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>i <Plug>(go-info)

let g:go_fmt_command = "goimports"
" }}}

let g:lightline = {
  \ 'colorscheme': 'Tomorrow_Night_Eighties',
  \ }

" Utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UtilSnipsJumpBackwardTrigger="<tab>"
set noshowmode

" Plugin: fzf {{{
nnoremap <silent> <C-p> :FZF<CR>
" }}}
" Plugin: fzf.vim {{{
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>C :Colors<CR>
nnoremap <leader>f :Files<CR>
" }}}
