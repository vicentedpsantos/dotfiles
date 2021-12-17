set shell=/usr/bin/zsh
set encoding=utf-8
set nocompatible
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on
set lazyredraw
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
set smartindent
set smarttab
set list listchars=tab:\ \ ,trail:·
set linebreak               " Wrap lines at convenient points
let mapleader=","
