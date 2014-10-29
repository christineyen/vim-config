let g:pathogen_disabled = []
if v:version < '704'
  call add(g:pathogen_disabled, 'YouCompleteMe')
endif
call pathogen#infect()

" ------------------------------------------------------------------------
" System setup
" ------------------------------------------------------------------------

set nocompatible
filetype plugin on
set nobackup      " turn backup off - most files are in git anyway
set nowritebackup " turn off writebackup
set noswapfile    " turn off creating .swpfiles everywhere
set vb            " no more dinging

" Should only be applied on shiny
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == 'shiny.local' && (match(expand("%:p:h"), "/Users/cyen$") >= 0)
  cd /Users/cyen/hungry/parse/
endif

" ------------------------------------------------------------------------
" Color / Syntax settings
" ------------------------------------------------------------------------

syntax on
au BufRead,BufNewFile *.less setfiletype less  " syntax .less = .css
au BufRead,BufNewFile *.jst setfiletype html
colorscheme vividchalk

" ------------------------------------------------------------------------
" Text Formatting
" ------------------------------------------------------------------------

set autoindent    " automatic indent new lines
"set smartindent   " be smart about it. disabled-bad interaction w endwise
set tabstop=2     " set tabstop to 2 characters
set shiftwidth=2  " sw = shiftwidth
set expandtab     " turn tabs to spaces
set nosmarttab    " who knows

autocmd Filetype ruby setlocal textwidth=80  " wrap at 80 chars for ruby
autocmd Filetype objc setlocal tabstop=4 noexpandtab shiftwidth=4

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

" ------------------------------------------------------------------------
" Better splits manipulation (via http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally)
" ------------------------------------------------------------------------

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move cursor to the new split panes opened to the bottom + right
set splitbelow
set splitright

" ------------------------------------------------------------------------
" Remapping (and plugin aliases)
" ------------------------------------------------------------------------

" lead with ,
let mapleader = ','

map <F3> <ESC>:set paste!<RETURN>

" NERDTree options
map <F2> <ESC>:NERDTreeToggle<RETURN>
map <F7> <ESC>:NERDTreeFind<RETURN>
let NERDTreeIgnore          = ['\.pyc$','\.swp$']    "ignore compiled python files
let NERDTreeSplitVertical   = 1                      "and open as vsplit
let NERDTreeChDirMode       = 2                      "change working dir when I change root

" CtrlP Options
let g:ctrlp_cmd = 'CtrlP .'
let g:ctrpl_custom_ignore = 'node_modules'
" ignore rails plugins for command-t, and generated asset packaging
set wildignore=vendor/plugins/*,public/assets/*,solr/data/*,tmp/*

" Surround remappings
nmap s ysi
nmap S ysa
nmap s$ ys$
nmap sv gvs

" YouCompleteMe - stop opening preview scratch
set completeopt=menu,menuone
let g:ycm_min_num_of_chars_for_completion = 4

let g:ctrlp_custom_ignore = 'node_modules\|\.sketch'

" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map <leader>w :call StripWhitespace ()<CR>

" ---------------------------------------------------------------------------
"  Make it easy to pull out a rough 'outline' of function declarations by
"  filetype
" ---------------------------------------------------------------------------

function! OpenOutlineView ()
  silent lvimgrep 'def ' %
  lopen
  set nomodified
endfunction
map <leader>o :call OpenOutlineView ()<CR>

function! InsertDebugger()
    " ~/vim/cpp/new-class.txt is the path to the template file
		call append('.', "require 'rubydebug'; debugger")
endfunction
map <leader>d :call InsertDebugger()<CR>


" ---------------------------------------------------------------------------
"  Useful tricks to remember for later
" ---------------------------------------------------------------------------

" autocmd FileType ruby set number    " set filetype-specific commands
autocmd BufWritePost,FileWritePost *.coffee :silent !coffee -c <afile>

