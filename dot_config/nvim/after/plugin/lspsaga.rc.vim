" if !exists('g:loaded_lspsaga') | finish | endif

" lua << EOF
" local saga = require 'lspsaga'

" saga.init_lsp_saga {
"   error_sign = '',
"   warn_sign = '',
"   hint_sign = '',
"   infor_sign = '',
"   border_style = "round",
" }

" EOF

" nnoremap <silent> <C-y> :Lspsaga diagnostic_jump_next<CR>
" " nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" " nnoremap <silent> <leader>sf :Lspsaga lsp_finder<CR>
" nnoremap <silent> <leader>fs :Lspsaga preview_definition<CR>
