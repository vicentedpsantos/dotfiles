"********** Persisitent Undo **********"
"Keep undo history across sessions by storing in file.
"Only works all the time
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

let g:user_emmet_leader_key='<C-Z>'

augroup FORMAT
  autocmd!
  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd BufRead,BufWritePre *.rb :echo("formattingrubby")
augroup end

" Automatically install missing plugins on startup
augroup UTILS
  autocmd!
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
augroup end
