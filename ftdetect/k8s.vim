if exists("b:k8s_file")
  finish
endif

" k8s
augroup k8sGroup
  autocmd BufNewFile *.k8s setfiletype k8s | setlocal fileencoding=utf-8 fileformat=unix
  autocmd BufRead *.k8s setfiletype k8s | setlocal fileencoding=utf-8 fileformat=unix
  autocmd FileType k8s nnoremap <buffer> <F5> :call ExecCurrentRow()<CR>
  autocmd FileType k8s nnoremap <buffer> <cr> :call ExecCurrentRow()<CR>
augroup END

let b:k8s_file = "kubernetes"
