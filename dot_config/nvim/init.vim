let g:config_files = [
      \ 'options.vim',
      \ 'autocmd.vim',
      \ 'maps.vim',
      \ 'plug.vim',
      \ 'themes.vim'
      \ ]

for s:fname in g:config_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor
