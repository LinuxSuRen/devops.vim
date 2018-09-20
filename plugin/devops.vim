" Section: Documentation {{{1

set number
set relativenumber
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
set dictionary+=/usr/share/dict/words
set invlist

"execute pathogen#infect()
syntax on

"colo molokai

silent :source ~/.vim/bundle/devops.vim/plugin/library.vim

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

nnoremap ev :split $MYVIMRC<cr>
nnoremap sv :source $MYVIMRC<cr>

" vim
autocmd FileType vim nnoremap <buffer> <leader>c I"<esc>

" make
autocmd FileType make nnoremap <buffer> <F5> :call ExecMakefile()<CR>

" dockerfile
autocmd FileType dockerfile nnoremap <buffer> <F5> :call ExecDockerfile()<CR>

function! K8sApply()
  :!kubectl apply -f %
endfunction

function! ExecCurrentRow()
  let res = systemlist(getline("."))
  call ConsoleView(res)
  execute "normal gg"
  call SwitchWin()
endfunction

" yaml
autocmd FileType yaml nnoremap <buffer> <F5> :call K8sApply()<CR>
autocmd FileType yaml nnoremap <buffer> <leader>c I#<esc>

" Section: Properties

if (!exists("g:Properties"))
  let g:Properties = "*.properties"
endif

augroup Properties
  "autocmd!

  ":set verbose=9
  "exe "autocmd BufReadCmd " . g:Properties . " call s:PropertiesInit(1) | call s:PropertiesDecrypt(1)"
augroup END

" Function: s:PropertiesInit(bufread)
"
" initialize plugin
function! s:PropertiesInit(bufread)
endfunction

" Function: s:PropertiesDecrypt(bufread)
"
" decrypt properties file
function! s:PropertiesDecrypt(bufread)
  let filename = resolve(expand("<afile>:p"))
  echom 'filename' . filename
  let autocmd_filename = fnamemodify(filename, ':r')
  echom 'autocmd_filename' . autocmd_filename
  let destname = tempname()
  call system('native2ascii -reverse ' . filename . ' > ' . destname)
  "exe ':doautocmd FileWritePost ' . destname
  set buftype=acwrite
  exe 'file' fnameescape(filename)
  execute ':doautocmd BufReadPre ' . fnameescape(autocmd_filename)
endfunction

iabbrev adn and
iabbrev @@ zxjlwt@126.com
