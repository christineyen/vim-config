call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set ruler
syntax on
"all relate to search
set incsearch ignorecase smartcase
" Highlight search matches
set hlsearch
set expandtab " turn tabs to spaces
set sw=2 " sw = shiftwidth
set ts=2 " set tabstop to 4 characters
set autoindent
filetype plugin on
" Backspace can kill pretty much everything
set backspace=indent,eol,start
set background=dark
"set number
"hi LineNr ctermfg=DarkBlue
"set vb
set wildmenu
set title
" link here: http://github.com/msanders/vim-files/blob/master/.vimrc
:ab #b /****************************************
:ab #e ^V^H*****************************************/

" turn backoff off, most files are in svn or git anyway
set nobackup
set nowb
set noswapfile

set showmatch "show matching brackets
set mat=5
" set path=~/tmz/aardvark/** "ensuring that all files in the aardvark project are looked for in path

" au BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

map <F2> <ESC>:NERDTreeToggle<RETURN>
map <F7> <ESC>:NERDTreeFind<RETURN>
"NERDTree options {{{
let NERDTreeIgnore          = ['\.pyc$','\.swp$']    "ignore compiled python files
let NERDTreeSplitVertical   = 1                      "and open as vsplit
let NERDTreeChDirMode       = 2                      "change working dir when I change root
"}}}

map <F3> <ESC>:set paste!<RETURN>
map <C-L> <ESC>:FufCoverageFile!<RETURN>
map <C-P> <ESC>:FufRenewCache<RETURN>

let mapleader = ','

colorscheme vividchalk
