call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ------------------------------------------------------------------------
" System setup
" ------------------------------------------------------------------------

set nocompatible
syntax on
filetype plugin on
set nobackup      " turn backup off - most files are in git anyway
set nowritebackup " turn off writebackup
set noswapfile    " turn off creating .swpfiles everywhere

" ------------------------------------------------------------------------
" Text Formatting
" ------------------------------------------------------------------------

set autoindent    " automatic indent new lines
"set smartindent   " be smart about it. disabled-bad interaction w endwise
set tabstop=2     " set tabstop to 2 characters
set shiftwidth=2  " sw = shiftwidth
set expandtab     " turn tabs to spaces
set nosmarttab    " who knows
set textwidth=80  " wrap at 80 chars by default

" ------------------------------------------------------------------------
" UI
" ------------------------------------------------------------------------

set background=dark            " not as relevant with colorscheme defined
set ruler                      " show the cursor position all the time
set wildmenu                   " turn on wild menu
set backspace=indent,eol,start " backspace kills pretty much everything
set whichwrap+=h,l             " cursor keys wrap too!
set shortmess=filtIoOA         " hide the vim startup message
set nostartofline              " don't jump to start of line when scrolling
set title                      " expose currently editing file in title bar

" ------------------------------------------------------------------------
" Search
" ------------------------------------------------------------------------

set incsearch     " do incremental searches
set ignorecase    " case-insensitive search
set smartcase     " override ignorecase if the search pattern has UPPERCASE

" ------------------------------------------------------------------------
" Visual Cues
" ------------------------------------------------------------------------

set showmatch     "show matching brackets
set mat=5         " duration to show matching brace (1/10 sec)
set hlsearch      " highlight search matches

" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

" ------------------------------------------------------------------------
" Remapping (and plugin aliases)
" ------------------------------------------------------------------------

" lead with ,
let mapleader = ','

map <F3> <ESC>:set paste!<RETURN>

" NERDTree options
map <F2> <ESC>:NERDTreeToggle<RETURN>
map <F7> <ESC>:NERDTreeFind<RETURN>
"NERDTree options {{{
let NERDTreeIgnore          = ['\.pyc$','\.swp$']    "ignore compiled python files
let NERDTreeSplitVertical   = 1                      "and open as vsplit
let NERDTreeChDirMode       = 2                      "change working dir when I change root
"}}}

map <C-L> <ESC>:CommandT<RETURN>
map <C-P><C-P> <ESC>:CommandTFlush<RETURN>


" ---------------------------------------------------------------------------
"  Useful tricks to remember for later
" ---------------------------------------------------------------------------

" autocmd FileType ruby set number    " set filetype-specific commands
