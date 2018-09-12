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
Plugin 'linuxsuren/vim-ide'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

```
