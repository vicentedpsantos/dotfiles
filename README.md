set nocompatible
filetype off
execute pathogen#infect()
call pathogen#helptags()

call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elixir-editors/vim-elixir'
call plug#end()

call vundle#begin()
Plugin 'scrooloose/syntastic'
call vundle#end()

" === Rubocop Warnings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']

" === Colorscheme"
colorscheme Monokai

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

"=== Indentation"
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

"=== NERDTree Config"
nmap <F6> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·
set linebreak    "Wrap lines at convenient points

* === Key mappings"
nnoremap <leader>rs :Rails<cr>
map <leader>/ gcc<cr>
map <leader>x :bn<cr>
map <leader>z :bp<cr>
map <leader>d :bd<cr>
map <leader>t :FZF<cr>
