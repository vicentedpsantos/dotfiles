set shell=/usr/bin/zsh
filetype on
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
execute pathogen#infect()
call pathogen#helptags()

call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'rking/ag.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'dense-analysis/ale'
Plug 'kchmck/vim-coffee-script'
call plug#end()

" === Turn off syntastic by default - ctrl-w E to activate
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" === prettier config
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'

" === Colorscheme"
" colorscheme Monokai
" colorscheme beekai
" colorscheme wellsokai
" colorscheme mopkai
colorscheme molokai
" colorscheme afterglow
" === Clipboard"
set clipboard=unnamedplus

" === General Config"
set number				"Line numbers do help
set backspace=indent,eol,start		"Allow backspace and delete in insert mode
set history=1000			"Store lots of :cmdline history
set showcmd				"Show incomplete cmds down the bottom
set showmode				"Show current mode down the bottom
set gcr=a:blinkon0			"Disable cursor blinks
set visualbell				"No sounds
set autoread				"Reload files changed outside vim
set hidden
syntax on
let mapleader=","
set timeout timeoutlen=1500
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

set wildmenu
set wildmode=list:longest,full
set mouse=a

" === Turn off Swap Files"
set noswapfile
set nobackup
set nowb

" === The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
nnoremap \ :Ag<SPACE>


"********** Persisitent Undo **********"
"Keep undo history across sessions by storing in file.
"Only works all the time
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" === Folds"
set foldmethod=indent			"fold based on indent
set foldnestmax=3			"deepest fold ist 3 levels
set nofoldenable			"dont fold by default

" === Scrolling"
set scrolloff=8				"Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set incsearch				"Find the next match as we type the search
set hlsearch				"Highlight searches by default
set ignorecase				"Ignore case when searching
set smartcase				"unless we type a capital

"********* Indentation **********
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

"********* NERDTree Config *******
nmap <leader>q :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·
set linebreak    "Wrap lines at convenient points

nnoremap <CR> G
nnoremap <leader>rs :Rails<cr>
map <leader>/ gcc<cr>
map <leader>x :bn<cr>
map <leader>z :bp<cr>
map <leader>d :bd<cr>
map <leader>t :FZF<cr>
let g:user_emmet_leader_key='<C-Z>'
