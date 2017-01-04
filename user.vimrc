set nocompatible                 " Disable vi-compatibility "
" -------------DEPENDENCY--------------"
so ~/.vim/plugins.vim
so ~/.vim/mswin.vim
" -------------THEME RELATED--------------"

set encoding=utf-8              " Necessary to show Unicode glyphs "
syntax enable
set background=dark
colorscheme Dev_Delight

" -------------TERMINAL RELATED--------------"
set t_Co=256
set term=xterm-256color
set title                       " change the terminal's title
set laststatus=0                " Hide Status line, 2 for always show"

"-------------FILE HISTORY--------------"
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo


"-------------Buffers--------------"

" Quickly go forward or backward to buffer "
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
set autowrite  "Save on buffer switch "


"-------------GENERAL SETTINGS--------------"
set showmode                    " always show what mode we're currently editing in "
set nowrap                      " don't wrap lines "
set backspace=indent,eol,start  " allow backspacing over everything in insert mode "
set visualbell                  " don't beep "
set noerrorbells                " don't beep "
set mouse=a                     " Allows Your To Use Mouse "
set timeout timeoutlen=1000 ttimeoutlen=10


"-------------INDENTION--------------"
set autoindent                  " always set autoindenting on "
set copyindent                  " copy the previous indentation on autoindenting "


"-------------TABS--------------"
set smarttab
set tabstop=4                   " a tab is four spaces "
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces "
set expandtab                   " expand tabs by default (overloadable per file type later) "
set shiftwidth=4                " number of spaces to use for autoindenting "
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>' "

"-------------LINE NUMBER--------------"
set nonumber                      " always show line numbers "
set linespace=15
" go to line no ie.: $number <enter> "
nnoremap <CR> G
hi LineNr ctermfg=none
hi LineNr ctermbg=none
" fake custom left padding for each window "
set foldcolumn=2
hi foldcolumn ctermbg=none

"-------------Split Management--------------"
" Split Default Layout"
set splitbelow
set splitright
set fillchars+=stl:\ ,stlnc:\ "
hi VertSplit cterm=none ctermfg=red ctermbg=none

"Resizing Split"
nmap == :vertical resize +5<cr>
nmap =25 :vertical resize 40<cr>
nmap =50 <c-w>=
nmap =75 :vertical resize 120<cr>

"Switching between splits. "
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Opening splits "
nmap vsp :vsplit<cr>
nmap sp :split<cr>


"-------------SEARCH--------------"
highlight Search cterm=underline
set ignorecase                              " ignore case when searching "
set smartcase                               " ignore case if search pattern is all lowercase "
set hlsearch                                " Highlight all matched terms. "
set incsearch                               " Incrementally highlight, as we type. "
nnoremap <F3> :set hlsearch!<CR>
nmap <Leader><space> :nohlsearch<cr>




"-------------Plugins--------------"

"/
"/ Vim Vinegar
"/

" press [dash] to view NetrW "
" press Ctrl [6] to go back "

"/
"/ CtrlP
"/
map <C-p> :CtrlP<cr>
nmap <C-e> :CtrlPMRUFiles<cr>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tags\|bootstrap\|tests\|vendor\|storage\|laradock\|docker\|npm-debug'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" I don't want to pull up these folders/files when calling CtrlP "
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*/tags/**



"Once CtrlP is open:

"Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"Press <c-f> and <c-b> to cycle between modes.
"Press <c-d> to switch to filename only search instead of full path.
"Press <c-r> to switch to regexp mode.
"Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"Use <c-y> to create a new file and its parent directories.
"Use <c-z> to mark/unmark multiple files and <c-o> to open them.
"Run :help ctrlp-mappings or submit ? in CtrlP for more mapping help.

"/
"/ NERD TREE
"/
nmap <C-\> :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeHijackNetrw = 0

"/
"/ NERD TREE SYNTAX HIGHLIGHT
"/
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
"/
"/ NerdTree Git
"/

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"/
"/ CTags
"/
" You Need to Install exuberant ctags to use this "
set tags=tags
nmap tt :tag<space>
nmap tp :tp<cr>
nmap tn :tn<cr>
nmap ts :ts<cr>

"/
"/ ACK
"/
" You Need to Install ack-grep to use This "
cnoreabbrev Ack Ack!
" Ignore Certain File and Folder in Search "
" case insensitive for a word with php extension "
nnoremap ack :Ack! -i -w --php
            \--ignore-dir={vendor,node_modules,storage,bootstrap,config,public,docker,resources}
            \--ignore-file='match:/tags/'<space>

" Short Cut Keys "
" ?    a quick summary of these keys, repeat to close
" o    to open (same as Enter)
" O    to open and close the quickfix window
" go   to preview file, open but maintain focus on ack.vim results
" t    to open in new tab
" T    to open in new tab without moving to it
" h    to open in horizontal split
" H    to open in horizontal split, keeping focus on the results
" v    to open in vertical split
" gv   to open in vertical split, keeping focus on the results
" q    to close the quickfix window

"/
"/ GReplace
"/

set grepprg=ack

let g:grep_cmd_opts = '--noheading'


"-------------BACKUP and SWAP FILES--------------"
" Swap files out of the project root "
"set backupdir=~/.vim/backup//"
set nobackup                                     " We Are Using GIT "
"set directory=~/.vim/swap//"
set noswapfile

"-------------Mappings--------------"
let mapleader = ","
let g:mapleader = ","

" Save Us From Pressing Shift "
nnoremap ; :

" Down is really the next line "
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model "
imap jj <esc>

" Disable Arrow Keys "
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"Make it easy to edit the Vimrc file. "
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <leader>ep :e ~/.vim/plugins.vim<CR>


" Create/edit file in the current directory "
nmap :ed :edit %:p:h/

"Auto change directory to match current file ,cd "
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"Pasting large amounts of text into Vim "
set pastetoggle=<F2>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap



"-------------Auto-Source--------------"
"Automatically source the Vimrc file on save. "

augroup autosourcing
        autocmd!
        autocmd BufWritePost .vimrc source %
augroup END

" Sudo Save "
cmap w!! w !sudo tee % >/dev/null

" Add the New Tag When File is Saved "
autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('ctags -a '.expand('%')) |
      \ endif

