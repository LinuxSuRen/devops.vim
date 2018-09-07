set number
set hlsearch
set ignorecase
set incsearch
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set autowrite
set ruler
set showmatch
set path+=**
set wildmenu

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
call plug#end()

"execute pathogen#infect()
syntax on

"colo molokai

silent :source ~/.vim/bundle/vim-ide/plugin/su-func.vim

"map		<special> <silent> <F1> :call Quit()<CR>" ---Quit
"map		<special> <silent> <F2> :call ContentReload()<CR>" ---Quit
"map		<special> <silent> <F3> :call OpenShell()<CR>" ---Shell
"map		<special> <silent> <F4> :call OpenTaskMgr()<CR>" ---TaskMgr
"nnoremap <silent> <F7> :PluginInstall<CR>
"
nnoremap <silent> <F1> :call Quit()<CR>" ---Quit
nnoremap <silent> <F2> :lcd %:p:h<CR>
map		<special> <silent> <F10> :call ReloadRc()<CR>" ---Reload RcFile
map		<special> <silent> <F11> :call ToggleFullScreen()<CR>" ---FullScreen
map		<special> <silent> <F12> :call EditRc()<CR>" ---Edit RcFile

map		<special> <silent> <C-S> :call Save()<CR>" ---Save
map		<special> <silent> <C-Tab> :call SwitchWin()<CR>" ---SwitchWin

imap	<special> <silent> <C-S> <ESC>:write<CR>a
imap	<special> <silent> <C-Tab> <ESC><C-W><C-W>a
nnoremap <C-S> :w<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-M> :tabNext<CR>

" make
autocmd FileType make nnoremap <buffer> <F5> :call ExecMakefile()<CR>

" golang
autocmd FileType go nnoremap <buffer> <F5> :GoRun<CR>
autocmd FileType go nnoremap <buffer> <F6> :GoTest<CR>
