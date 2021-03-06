" default color scheme
colorscheme molokai
set macligatures
" Nerd font-patched Monaco: https://github.com/Karmenzind/monaco-nerd-fonts
"set guifont=Monaco\ Nerd\ Font\ Complete\ Mono:h10
set guifont=Hack\ Regular\ Nerd\ Font\ Complete\ Mono:h11
set antialias
set transparency=5
highlight Cursor guifg=white guibg=#BAAF07
highlight iCursor guifg=white guibg=#A2C257

" go mono-optimized color scheme
"set background=light
"colorscheme solarized
"set guifont=Go\ Mono:h11
"set transparency=2
"set linespace=2

" everything else
set guioptions=egmtr
"set guicursor=n-v-c-i:block-Cursor
set number        " line numbers
set t_Co=256 " enable 256 colors in vim
let g:rehash256=1

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver20-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
