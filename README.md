# vim-ide

You need setup [VundleVim](https://github.com/VundleVim/Vundle.vim) first.

# .vimrc

Suggestion configuration:


```
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'linuxsuren/devops.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'christianrondeau/vim-base64'

" git wrapper
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'tommcdo/vim-fubitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

```
