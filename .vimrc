"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "go,html,javascript,python"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
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
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
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
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
" }}}

" tmux {{{
Plug 'edkolev/tmuxline.vim'
" }}}

" vimux {{{
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'
" }}}

" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'


"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

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
silent! colorscheme Tomorrow-Night-Eighties

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

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

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
"vim-flake8 conflicts with syntastic, don't autorun flake8 on save
"autocmd BufWritePost *.py call Flake8()
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

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F3> :NERDTreeFind<CR>
nmap <F4> :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" Go {{{
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <leader>e <Plug>(go-rename)
  au FileType go nmap <leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

  au FileType go map <C-n> :cnext<CR>
  au FileType go map <C-m> :cprevious<CR>
  au FileType go nnoremap <leader>a :cclose<CR>
  " Open go doc in vertical window, horizontal or tab
  au FileType go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
  au FileType go nnoremap <leader>s :sp <CR>:exe "GoDef" <CR>
  au FileType go nnoremap <leader>ts :tab split <CR>:exe "GoDef" <CR>

augroup END
" }}}

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

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
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
" }}}

" Configure vimux {{{
" Prompt for a command to run
map <leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>
" Close the tmux runner pane
map <Leader>vc :VimuxCloseRunner<CR>
" }}}

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

