" Normally files with an 'md' extension are recognized as Modula 2. Since
" ftdetect plugins are processed after the built-in types, this will
" override them.
"
if has("autocmd")
  au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.md set ft=markdown
endif

