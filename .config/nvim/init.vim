set shell=/usr/bin/zsh
set encoding=utf-8
set nocompatible
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on

call plug#begin()
Plug 'w0rp/ale'
Plug 'mpickering/hlint-refactor-vim'
Plug 'junegunn/vim-easy-align'
Plug 'raichoo/haskell-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-endwise'
Plug 'rstacruz/vim-closer'
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-editors/vim-elixir'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'chrisbra/Colorizer'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'thoughtbot/vim-rspec'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
" Completion / LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" React/JS/TS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
" Kitty
Plug 'fladson/vim-kitty'
" ChucK
Plug 'gmarik/Vundle.vim'
Plug 'Shougo/vimproc.vim'
Plug 'highwaynoise/chuck.vim'
" Vue
Plug 'leafOfTree/vim-vue-plugin'
" Color
Plug 'Badacadabra/vim-archery'
Plug 'projekt0n/github-nvim-theme'
" Tests
Plug 'junegunn/vader.vim'
" Clojure
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-clojure-highlight'
Plug 'tpope/vim-fireplace'
call plug#end()

" === Colorscheme
set background=dark
" colorscheme archery

let g:github_transparent = "true"
colorscheme github_*

" === Clipboard
set clipboard=unnamedplus

" === General config
set number
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set gcr=a:blinkon0
set visualbell
set autoread
set hidden
set timeout timeoutlen=1500
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set ruler
set smartcase			         	" unless we type a capital
set magic                   " For regular expressions turn magic on
set mat=2                   " How many tenths of a second to blink when matching brackets
set wildmenu
set wildmode=longest,list   " get bash-like tab completions
set noswapfile
set nobackup
set nowb
set foldmethod=indent			  " fold based on indent
set foldnestmax=3			      " deepest fold ist 3 levels
set nofoldenable			      " dont fold by default
set scrolloff=8				      " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set autoindent
set smartindent
set smarttab
set list listchars=tab:\ \ ,trail:·
set linebreak               " Wrap lines at convenient points

let mapleader=","

" Insert mode mappings
inoremap <c-u> <esc>viwUA

" Normal mode mappings
nnoremap p p`]<Esc>
nnoremap <c-u> viwU$
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <S-h> <S-^>
nnoremap <S-l> <S-$>

"********** Persisitent Undo **********"
"Keep undo history across sessions by storing in file.
"Only works all the time
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" NERDTree
nmap <leader>q :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

nnoremap <CR> G
nnoremap <leader>rb :RuboCop -a<cr>
map <leader>x :bn<cr>
map <leader>z :bp<cr>
map <leader>d :bd<cr>
noremap <leader>a =ip
let g:user_emmet_leader_key='<C-Z>'

" Telescope file finder
nnoremap <leader>t <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" *********** Comment
map <leader>cc gcc

autocmd BufRead,BufWritePre *.sh normal gg=G
autocmd FileType json syntax match Comment +\/\/.\+$+

" Haskell auto-indent
let g:haskell_enable_quantification = 1  " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1     " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrow_syntax = 1    " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_type_roles = 1       " to enable hightlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable hightlighting of `static`
let g:haskell_backpack = 1                " to enable hightlighting of backpack keywords

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

" Rspec
map <Leader>rsc :call RunCurrentSpecFile()<CR>
map <Leader>rss :call RunNearestSpec()<CR>
map <Leader>rsl :call RunLastSpec()<CR>
map <Leader>rsa :call RunAllSpecs()<CR>

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" LSP Config / Completion
lua << EOF
  local nvim_lsp = require('lspconfig')
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  end

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { 'solargraph' }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
EOF

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" END LSP Config / Completion

" Tabline
lua << EOF
  require("bufferline").setup{}
EOF
