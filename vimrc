runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'kshenoy/vim-signature'
"Plugin 'Lokaltog/vim-powerline'


" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Function to show the current function in the cursor.
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>

color dracula

" Allow backspacing over everything in insert mode (pls)
set backspace=indent,eol,start

set ruler
set ttimeout
set ttimeoutlen=100

" Display "@@@" in the last line if its truncated.
set display=truncate

set scrolloff=5

if has('reltime')
    set incsearch
endif

" Ctrl-A and Ctrl-X without octal numbers.
set nrformats-=octal

" No Ex mode (useless), instead use Q to format.
map Q gg

"inoremap <C-U> <C-G>u<C-U>

" Try to turn on syntax highlighting if terminal supports it.
if &t_Co > 2
    syntax on
    let c_comment_strings=1 " Highlight string in C comments.
endif

if has('autocmd')
    filetype plugin indent on

    augroup vimStartup
        au!

        " When editing, always jump to the last known cursor position.
        " Unless said position is invalid, of course.
        autocmd BufReadPost *
          \ if line("'\"") >= 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

    augroup END

endif "has('autocmd')

" Helper command to diff current buffer and original file.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d | diffthis
            \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
    " No idea what this does.
    set nolangremap
endif

if has('mouse')
    set mouse=r
endif
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number relativenumber

" mostra comando (orly)
set showcmd

" seta o 'autocomplete' do vim
set wildmode=longest,list,full
set wildmenu

" habilita segunda linha de status para powerbar
set laststatus=2

