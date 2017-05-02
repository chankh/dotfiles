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
Plug 'Shougo/neocomplete.vim'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer'}
Plug 'terryma/vim-expand-region'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'vim-jp/vim-go-extra'
"Plug 'sourcegraph/sourcegraph-vim'
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
" vimux {{{
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'
" }}}

call plug#end()

" Leader - ( Spacebar )
let mapleader = "\<Space>"

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

syntax on

" show line number
set number
set relativenumber

" turn off backup
set nobackup
set noswapfile

" change the terminal title
set title

" highlight the current line
set cursorline

" stop that ANNOYING beeping
set visualbell

set background=dark
silent! colorscheme solarized

" toggle paste mode
set pastetoggle=<F2>

" toggle tagbar
nmap <F8> :TagbarToggle<CR>

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

nmap <F4> :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" Go {{{
autocmd Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go map <C-n> :cnext<CR>
au FileType go map <C-m> :cprevious<CR>
au FileType go nnoremap <leader>a :cclose<CR>
" Open go doc in vertical window, horizontal or tab
au FileType go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au FileType go nnoremap <leader>s :sp <CR>:exe "GoDef" <CR>
au FileType go nnoremap <leader>t :tab split <CR>:exe "GoDef" <CR>

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
" }}}

" neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" }}}

let g:lightline = {
  \ 'colorscheme': 'solarized',
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
