if exists("b:golang_file")
  finish
endif

" golang
augroup golangGroup
  autocmd FileType go nnoremap <buffer> <F5> :GoRun<CR>
  autocmd FileType go nnoremap <buffer> <F6> :GoTest<CR>
  autocmd FileType go nnoremap <buffer> <leader>c I//<esc>
augroup END

let b:golang_file = "golang"
