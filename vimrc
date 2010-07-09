" 
set nocompatible "No vi compatibility

" Attempt to determine filetype based on name and contents
filetype indent plugin on
syntax on

" Set to auto read when a file is changed externally
set autoread

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
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"For Amarok, tabs are 4 spaces
"set tabstop=4
"set shiftwidth=4
"set expandtab
"set softtabstop=4 "Treat 4spaces like a tab
"set sw=4

" clojure
au BufRead,BufNewFile *.clj set filetype=clojure
" For jQuery
au BufRead,BufNewFile *.js set ft=javascript.jquery

" mini buffer explorer
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorererMoreThanOne = 0
let g:miniBufExplModeSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow = 1

" Rails
" Change which file opens after executing :Rails command
"let g:rails_default_file='config/database.yml'
