" Use Vim settings, rather then Vi settings
set nocompatible

" Set to Linux line endings
set ff=unix

" ------------
" Color scheme
" ------------
if has('vim_starting')
  syntax enable
  set background=dark
  if $COLORTERM == 'gnome-terminal'
    " Access colors present in 256 colorspace
    let base16colorspace=256
    set t_Co=256
  endif
  if &t_Co < 256
    colorscheme default
  else
    try
      colorscheme jellybeans
    catch
      colorscheme github
    endtry
    highlight NonText guibg=#060606
    highlight Folded  guibg=#0A0A0A guifg=#9090D0
  endif
endif
hi Normal ctermbg=none
"highlight NonText ctermbg=none

" -----------
" Status Line
" -----------
" vim-airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"

" ----------
" Editing
" ----------
" set paste
set pastetoggle=<F10>

" Leader
let mapleader = ","

" Mapping insert/normal
imap ;; <Esc>
nmap ;; :wq<CR>

" Macro
nnoremap <Space> @d
" nnoremap <Space> @q

noremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
inoremap <C-v> <F10><C-r>+<F10>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Force save read-only files with :w!! or :sudow
cmap w!! %!sudo tee > /dev/null %
cnoremap sudow w !sudo tee % > /dev/null

" -------
" Explore
" -------

" NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if !argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map <c-l> :tabn<cr>
" map <c-h> :tabp<cr>
" map <c-n> :tabnew<cr>

" ctrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Explorer mode
let g:netrw_liststyle=3
"map <leader>k :E<cr> 
"map <C-n> :E<CR>

" time delay
set timeoutlen=2000 ttimeoutlen=0

" Autosave
let g:auto_save = 1 " enable AutoSave on Vim startup
au FocusLost * :wa         " Always autosave everything
au FocusLost * silent! wa  " Ignore warnings from untitled buffers
set autowriteall

set cm=blowfish
set backspace=2   " Backspace deletes like most programs in insert mode

set history=100
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set ignorecase
set smartcase
set hlsearch
set showmode

" --- BACKUP ---
" set directory=~/tmpvim
set backupdir=~/tmpvim
set undodir=~/tmpvim
set swapfile
set backup
set writebackup
set undofile
" set nobackup
" set nowritebackup

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth'
  " autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  " autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  " autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Numbers bar
set number
set numberwidth=5
nnoremap <F2> :set nonumber!<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

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

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Automatically reload config
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

