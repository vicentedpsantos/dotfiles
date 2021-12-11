let s:my_theme_dict = {}

function! s:my_theme_dict.github() dict abort
  echo "Setting github theme"
  let g:github_transparent = "true"
  colorscheme github_*
endfunction

function! s:my_theme_dict.dracula() dict abort
  echo "Setting dracula theme"
  let g:dracula_colorterm = 0
  colorscheme dracula
endfunction

function! s:my_theme_dict.onedark() dict abort
  echo "Setting onedark theme"
  if (has("autocmd") && !has("gui_running"))
    augroup colorset
      autocmd!
      let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
      autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
    augroup END
  endif

  colorscheme onedark
endfunction

function! s:my_theme_dict.wal() dict abort
  colorscheme wal
  :hi CursorLine   cterm=bold ctermbg=NONE ctermfg=NONE
  :hi CursorLineNr cterm=bold term=bold ctermfg=012 gui=bold
endfunction

let s:candidate_theme = [
      \ 'wal'
      \ ]

let s:theme = utils#RandElement(s:candidate_theme)
let s:colorscheme_func = printf('s:my_theme_dict.%s()', s:theme)

if has_key(s:my_theme_dict, s:theme)
  execute 'call ' . s:colorscheme_func
endif
