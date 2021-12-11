if !exists('g:loaded_telescope') | finish | endif

nnoremap <leader>t <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope file_browser<cr>
nnoremap <leader>gg <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
  require('telescope').setup{
    defaults = {
      prompt_prefix = "~~> ",
      selection_caret = "--> "
    }
  }
EOF
