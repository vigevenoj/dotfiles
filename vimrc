" 
set nocompatible "No vi compatibility

" Start Pathogen
filetype off
call pathogen#runtime_append_all_bundles()

" Attempt to determine filetype based on name and contents
syntax on
filetype indent plugin on

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

" Map NERDTree toggle to F2 for now
map <F2> :NERDTreeToggle<CR>
map <silent> <Leader>l :set cursorline! <CR>

" clojure
au BufRead,BufNewFile *.clj set filetype=clojure
" For jQuery
au BufRead,BufNewFile *.js set ft=javascript.jquery
" Freemarker
au BufRead,BufNewFile *.ftl set ft=ftl
