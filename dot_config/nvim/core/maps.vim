" Visual mode mappings
vnoremap < <gv
vnoremap > >gv

" Insert mode mappings
inoremap <c-u> <esc>viwUA

" Normal mode mappings
nnoremap p p`]<Esc>
nnoremap <c-u> viwU$
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <S-h> <S-^>
nnoremap <S-l> <S-$>
nnoremap Y y$
nnoremap trm :term<CR>
nnoremap <CR> G
nnoremap <leader>cp :let @+=@%

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Moving text
nnoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <C-j> <esc>:m .+1<CR>==
nnoremap <leader>j :m .+1<CR>==

" NERDTree
nmap <leader>q :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

nnoremap <leader>rb :RuboCop -a<cr>
map <leader>x :bn<cr>
map <leader>z :bp<cr>
map <leader>d :bd<cr>
noremap <leader>a =ip

" *********** Comment
map <leader>cc gcc

" Rspec
map <Leader>rsc :call RunCurrentSpecFile()<CR>
map <Leader>rss :call RunNearestSpec()<CR>
map <Leader>rsl :call RunLastSpec()<CR>
map <Leader>rsa :call RunAllSpecs()<CR>
