" Vim Configuration
" =================

" Initiate good settings, rather then Vi settings
set nocompatible
"augroup vimrc
"  autocmd!
"augroup END

" Set to Linux line endings
set ff=unix

" Copy
" vmap <C-c> "+y

" Searching
set rtp+=~/.fzf

" Editing
set paste
set pastetoggle=<F10>

" Leader
let g:mapleader = " "

" Mapping insert/normal
imap ;; <Esc>
nmap ;; :w<CR>
nmap ;: :wq<CR>
nmap :W :w<CR>
nmap :Q :q<CR>
nmap :Q! :q!<CR>
nmap :WQ :wq<CR>
cabbrev ew :wq
cabbrev qw :wq

" Clipboard
set clipboard=unnamedplus

" Switch windows with two keystrokes
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Enter command mode with one keystroke
" nnoremap ; :
" nnoremap : ;

" Start an external command with a single bang
nnoremap ! :!

" Auto-save a file when you leave insert mode
" autocmd InsertLeave * if expand('%') != '' | update | endif
" inoremap jk <Esc>:w<cr>

" Macro
nnoremap <Space> @d
" nnoremap <Space> @q

noremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
inoremap <C-v> <F10><C-r>+<F10>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
inoremap jk <ESC>

" Leader key
let mapleader = ","

" Force save read-only files with :w!! or :sudow
" cmap w!! %!sudo tee > /dev/null %
" cnoremap sudow w !sudo tee % > /dev/null

" NERDTree
" autocmd vimenter * NERDTree
"map <C-z> :NERDTreeToggle<CR>
"autocmd StdinReadPre * let s:std_in=1
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" autocmd VimEnter * if !argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map <c-l> :tabn<cr>
" map <c-h> :tabp<cr>
" map <c-n> :tabnew<cr>

" ctrlP
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" Explorer mode
"let g:netrw_liststyle=3
"map <leader>k :E<cr> 
"map <C-n> :E<CR>

" Autosave
let g:auto_save = 1 " enable AutoSave on Vim startup
au FocusLost * :wa         " Always autosave everything
au FocusLost * silent! wa  " Ignore warnings from untitled buffers
set autowriteall

set cm=blowfish
set backspace=2   " Backspace deletes like most programs in insert mode

set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set ignorecase
set smartcase
set hlsearch
set showmode

" Backup directories
" set directory=~/.tmpvim
set backupdir=~/.tmpvim
set undodir=~/.tmpvim
set swapfile
set backup
set writebackup
set undofile
" set nobackup
" set nowritebackup

" colors
" Access colors present in 256 colorspace
" set background=dark
" let base16colorspace=256
" colorscheme base16-default

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
"  syntax on
"endif

" Numbers bar
set number
set numberwidth=5
nnoremap <F2> :set nonumber!<CR>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
" nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
" nnoremap <Leader>s :call RunNearestSpec()<CR>
" nnoremap <Leader>l :call RunLastSpec()<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Automatically reload config
"augroup myvimrc
"  au!
"  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END

" Easy block selection with mouse
" noremap <M-LeftMouse> <4-LeftMouse>
" inoremap <M-LeftMouse> <4-LeftMouse>
" onoremap <M-LeftMouse> <C-C><4-LeftMouse>
" noremap <M-LeftDrag> <LeftDrag>
" inoremap <M-LeftDrag> <LeftDrag>
" onoremap <M-LeftDrag> <C-C><LeftDrag>

" Select text with mouse scrolling
" set mouse=a

" Vertical line indentation
let g:indentLine_color_term = 239
" let g:indentLine_color_gui = '#09AA08'
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '│'
set list lcs=tab:\|\ 

" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
  augroup END
endif

" Syntastic
let g:syntastic_javascript_eslint_generic = 1
let g:syntastic_javascript_eslint_exec = 'xo'
let g:syntastic_javascript_eslint_args = '--reporter=compact'
let g:syntastic_javascript_checkers = ['eslint']
" autocmd bufwritepost *.js silent !standard % --format
set autoread

" Local config
" if filereadable($HOME . "/.vimrc.local")
"  source ~/.vimrc.local
" endif

" Extension config
if filereadable($HOME . "/.vimrc.plugs")
  source ~/.vimrc.plugs
endif

" Snippets config
" if filereadable($HOME . "/.vimrc.snippets")
"  source ~/.vimrc.snippets
" endif

