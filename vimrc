runtime! debian.vim
unlet! skip_defaults_vim

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

source $VIMRUNTIME/defaults.vim

set mouse=r
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
