set confirm                                                      " Display confirmation dialog when closing unsaved files
set number                                                       " Show line numbers
"set numberwidth=2                                               " Increase width
set relativenumber number                                        " Show line numbers relative to curser
set cursorline                                                   " Highlight the current line
set guicursor=
set scrolloff=23                                                 " Number of screen lines above and below the cursor
set colorcolumn=80                                               " Line 76 and 80 are colored
":hi ColorColumn ctermbg=Magenta                                 " Column colors
set nowrap                                                       " Do not wrap lines
set list                                                         " Show invisible characters
set listchars=eol:$,tab:[],trail:·,extends:»,precedes:«,space:·  " List of invisible characters
set showmatch                                                    " Highlight matching brace
"set visualbell                                                  " Use visual bell (no beeping)
set showcmd                                                      " Show partial commands in the last line
set guifont=Ubuntu\ Mono\ 12                                     " Set font in vim

set hlsearch                                                     " Highlight all search results
set smartcase                                                    " Enable smart-case search
set ignorecase                                                   " Always case-insensitive
set incsearch                                                    " Searches for strings incrementally
set wildmenu                                                     " Display tab complete options menu
set encoding=utf-8                                               " Use an encoding that supports unicode

set autoindent                                                   " Auto-indent new lines
set smartindent                                                  " Enable smart-indent
set smarttab                                                     " Enable smart-tabs
set shiftwidth=4                                                 " Number of auto-indent spaces
set softtabstop=4                                                " Number of spaces per Tab
set tabstop=4                                                    " Indent using four spaces
set expandtab                                                    " Convert tabs to spaces.

set ruler                                                        " Show row and column ruler information
"set showtabline=2                                               " Show tab bar
set cmdheight=2                                                  " Command line height

set undolevels=1000                                              " Number of undo levels
set backspace=indent,eol,start                                   " Backspacing over indention, line breaks and insertion start
set dir=~/.cache/vim                                             " Directory to store swap files
set backupdir=~/.cache/vim                                       " Directory to store backup files
set undodir=~/.cache/vim/undo                                    " Directory to store undo cache
"packadd! dracula
"colo dracula
packadd! gruvbox
colo gruvbox
let g:gruvbox_contrast_dark = 'soft'
set bg=dark

let g:netrw_keepdir = 0                                          "current directory and the browsing directory synced
let g:netrw_winsize = 25                                         "Set netrw window size

                                                                 "open Netrw in the directory of the current file.
nnoremap <silent> <leader>dd :Lexplore %:p:h<CR>
                                                                 "open Netrw in the current working directory.
nnoremap <silent> <leader>da :Lexplore<CR>

nnoremap <Space> :w<CR>
nnoremap <silent> <C-l> :nohl<CR>
nnoremap <silent> <C-s> :term<CR>
nnoremap <silent> <leader>wz <C-w>z
nnoremap <silent> <leader>wx <C-w>x
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>[ :bp<CR>
nnoremap <silent> <leader>] :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>b :bn<CR>
nnoremap <silent> <leader>bb :bp<CR>
nnoremap <silent> <leader>tn :tabn<CR>
nnoremap <silent> <leader>tp :tabp<CR>
nnoremap <silent> <leader>t :tabn<CR>
nnoremap <silent> <leader>tt :tabp<CR>
nnoremap <leader>so :so ~/.config/vim/sessions/
"use 'date -d @number' to convert timestamps.
nnoremap <silent> <leader>ts :.r !echo "Timestamp: $(date +"\%s")"<CR>0
nnoremap <silent> <F3> :set list!<CR>
nnoremap <silent> <leader>cc :set cc-=5<CR>:set cc-=76<CR>
map <silent> <leader>y "+y
map <silent> <leader>yy 0vg_"+y
map <silent> <leader>p "+gp
vnoremap <silent> <F6> :w !xsel -ib<CR>
nnoremap <silent> <F7> :-r !xsel -ob<CR>
"vnoremap <silent> <F6> :w !wl-copy -p<CR>
"nnoremap <silent> <F7> :-r !wl-paste<CR>

nnoremap <leader>7 :setlocal spell spelllang=en_us<CR>
nnoremap <leader>8 :setlocal nospell<CR>
