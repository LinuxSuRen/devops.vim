if exists("b:current_syntax")
  finish
endif

syntax keyword k8sKeywords kubectl get edit

highlight link k8sKeywords  Keyword
