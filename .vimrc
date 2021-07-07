set shell=/usr/bin/zsh
set encoding=utf-8
filetype on
set nocompatible
execute pathogen#infect()
call pathogen#helptags()

call plug#begin()
"General
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" React/JS/TS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
" Coc TS server
call plug#end()

" === Turn off syntastic by default - ctrl-w E to activate
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" === prettier config
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'

" === Colorscheme"
set background=dark
" colorscheme Monokai
" colorscheme beekai
" colorscheme wellsokai
" colorscheme mopkai
color molokai
" colorscheme afterglow

" === Clipboard"
set clipboard=unnamedplus

nnoremap p p`]<Esc>


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

" Insert mode mappings
inoremap <c-u> <esc>viwUA
inoremap jk <esc>
inoremap <esc> <nop>

" Normal mode mappings
nnoremap <c-u> viwU$
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <S-h> <S-^>
nnoremap <S-l> <S-$>

" Always show current position
set ruler

" Ignore case when searching
set ignorecase
set smartcase				"unless we type a capital

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

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

"********* Indentation **********
set autoindent
set smartindent
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"********* NERDTree Config *******
nmap <leader>q :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

set list listchars=tab:\ \ ,trail:·
set linebreak    "Wrap lines at convenient points

nnoremap <CR> G
nnoremap <leader>rb :RuboCop -a<cr>
map <leader>x :bn<cr>
map <leader>z :bp<cr>
map <leader>d :bd<cr>
map <leader>t :FZF<cr>
noremap <leader>a =ip
let g:user_emmet_leader_key='<C-Z>'

" *********** Comment
map <leader>cc gcc

hi Normal guibg=NONE ctermbg=NONE"

filetype plugin on
filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G

" Coc config
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

autocmd FileType json syntax match Comment +\/\/.\+$+

" Cria o comando `:Format` que formata o buffer inteiro
command! -nargs=0 Format :call CocAction('format')

" executa o `:Format` antes de salvar o arquivo
augroup autoformat
  au!
  autocmd BufWritePre *.rs Format " pra cada arquivo que vc quiser que formate automático, desde que tenha um language server pra ele instalado e rodando
augroup END

" React/JS/TS Setup
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
