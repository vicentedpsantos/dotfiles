if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
  " Pywal
  Plug 'dylanaraps/wal.vim'
  " Colors
  Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'joshdick/onedark.vim'
  " HTML expansion
  Plug 'mattn/emmet-vim'
  " Navigation
  Plug 'preservim/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  " Utils
  Plug 'chrisbra/Colorizer'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  " [](){}
  Plug 'rstacruz/vim-closer'
  Plug 'tpope/vim-endwise'
  " Elixir
  Plug 'elixir-editors/vim-elixir'
  " Ruby
  Plug 'ngmy/vim-rubocop'
  Plug 'thoughtbot/vim-rspec'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  " Rust
  Plug 'cespare/vim-toml'
  Plug 'rust-lang/rust.vim'
  " Completion / LSP
  Plug 'dense-analysis/ale'
  " Clojure
  Plug 'guns/vim-clojure-highlight'
  Plug 'guns/vim-sexp'
  Plug 'tpope/vim-fireplace'
  Plug 'tpope/vim-sexp-mappings-for-regular-people'
  " Dart/Flutter
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
  Plug 'natebosch/vim-lsc'
  Plug 'natebosch/vim-lsc-dart'
  " Co-pilot
  Plug 'github/copilot.vim'

  if has("nvim")
    Plug 'projekt0n/github-nvim-theme'
    " Completion / LSP
    Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    " Plug 'ryanoasis/vim-devicons'
    Plug 'akinsho/bufferline.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope.nvim'
    " checkhealth
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  endif

call plug#end()
