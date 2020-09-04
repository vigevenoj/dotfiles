" 
set nocompatible "No vi compatibility

" Start Pathogen
call pathogen#infect()
filetype off

" Attempt to determine filetype based on name and contents
filetype plugin indent on
syntax on

" Set to auto read when a file is changed externally
set autoread

" Put backups and swap files in a central place, not in-tree
set backup
set swapfile
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

set incsearch " do incremental searching
set hlsearch " Highlight search. temporarily turn off with <C-L>
set ignorecase " Ignore case while searching
set smartcase " except when using capital letters
set wildmenu 
set showmatch " Show matching brackets when cursor is over them

" Always display the status line, even if only one window is displayed
set laststatus=2
" Set command window height to 2 lines, to avoid cases of having to 
" press Enter to continue
set cmdheight=2

" Map Y to act like D and C; ie yank until EOL rather than act as yy
map Y y$

" Map NERDTree toggle to F2 for now
map <F2> :NERDTreeToggle<CR>
map <silent> <Leader>l :set cursorline! <CR>

" options for vimdiff
set diffopt=filler
set diffopt+=iwhite
set tabstop=2
set shiftwidth=2
set expandtab

" Bash
au FileType sh setlocal shiftwidth=2 tabstop=2

" Ruby should be two spaces instead of tabs
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype bash setlocal ts=2 sw=2 expandtab

" https://github.com/klen/python-mode/issues/525
let g:pymode_rope_autoimport = 0
:let g:pymode_rope = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Nyan! ------------------------------------------------------------------- {{{

function! NyanMe() " {{{
    hi NyanFur             guifg=#BBBBBB
    hi NyanPoptartEdge     guifg=#ffd0ac
    hi NyanPoptartFrosting guifg=#fd3699 guibg=#fe98ff
    hi NyanRainbow1        guifg=#6831f8
    hi NyanRainbow2        guifg=#0099fc
    hi NyanRainbow3        guifg=#3cfa04
    hi NyanRainbow4        guifg=#fdfe00
    hi NyanRainbow5        guifg=#fc9d00
    hi NyanRainbow6        guifg=#fe0000


    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanFur
    echon "╰"
    echohl NyanPoptartEdge
    echon "⟨"
    echohl NyanPoptartFrosting
    echon "⣮⣯⡿"
    echohl NyanPoptartEdge
    echon "⟩"
    echohl NyanFur
    echon "⩾^ω^⩽"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echon " "
    echohl NyanFur
    echon "”   ‟"
    echohl None

    sleep 1
    redraw
    echo " "
    echo " "
    echo "Noms?"
    redraw
endfunction " }}}
command! NyanMe call NyanMe()

