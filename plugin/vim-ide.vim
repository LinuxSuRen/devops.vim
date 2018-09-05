set number
set hlsearch
set ignorecase
set incsearch
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set autowrite

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
call plug#end()

"execute pathogen#infect()
syntax on

"colo molokai

nnoremap <silent> <F3> :PluginInstall<CR>
nnoremap <silent> <F5> :GoRun<CR>
nnoremap <silent> <F6> :GoTest<CR>
