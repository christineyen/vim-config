let g:pathogen_disabled = []
if v:version < '800'
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

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" ------------------------------------------------------------------------
" Color / Syntax settings
" ------------------------------------------------------------------------

syntax on
au BufRead,BufNewFile *.less setfiletype less  " syntax .less = .css
au BufRead,BufNewFile *.jst setfiletype html
colorscheme Tomorrow-Night-Bright

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
autocmd Filetype javascript.jsx setlocal tabstop=4 shiftwidth=4
autocmd Filetype css setlocal tabstop=4 shiftwidth=4
autocmd Filetype scss setlocal tabstop=4 shiftwidth=4
autocmd Filetype tmpl setlocal tabstop=4 shiftwidth=4

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
" Remapping
" ------------------------------------------------------------------------

inoremap kj <Esc>
" lead with ,
let mapleader = ','

map <F3> <ESC>:set paste!<RETURN>

" NERDTree options
map <F2> <ESC>:NERDTreeToggle<RETURN>
map <F7> <ESC>:NERDTreeFind<RETURN>

" ------------------------------------------------------------------------
" Plugin configuration
" ------------------------------------------------------------------------

let NERDTreeIgnore          = ['\.pyc$','\.swp$']    "ignore compiled python files
let NERDTreeSplitVertical   = 1                      "and open as vsplit
let NERDTreeChDirMode       = 2                      "change working dir when I change root

" CtrlP Options
let g:ctrlp_cmd = 'CtrlP .'
if exists('g:ctrlp_custom_ignore')
  unlet g:ctrlp_custom_ignore
endif
let g:ctrlp_custom_ignore = {
 \ 'dir': '\v[\/](vendor|node_modules|public/(docs|assets|downloads|stylesheets/compiled|fonts)|tmp/|log/|doc/).*$',
 \ 'file': '\v\.(png|jpg|gif|zip|gz|xar)$'
 \ }
" ignore rails plugins for command-t, and generated asset packaging
set wildignore+=vendor\\**,public/assets/*,solr/data/*,tmp/*

" Surround remappings
nmap s ysi
nmap S ysa
nmap s$ ys$
nmap sv gvs

" YouCompleteMe - stop opening preview scratch
set completeopt=menu,menuone
let g:ycm_min_num_of_chars_for_completion = 4

" Tagbar options
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" vim-markdown options
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toml_frontmatter = 1

" vim-go options
let g:go_version_warning = 0

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
