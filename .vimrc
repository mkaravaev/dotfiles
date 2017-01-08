"Plugins
call plug#begin('~/.vim/plugged')

Plug 'dag/vim-fish'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rking/ag.vim'
Plug 'easymotion/vim-easymotion'
Plug 'kchmck/vim-coffee-script'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'jpo/vim-railscasts-theme'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'slim-template/vim-slim'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
"JS
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
"Code check
Plug 'scrooloose/syntastic'
Plug 'nanotech/jellybeans.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

call plug#end()

"Key mappings
let mapleader = "\<Space>"
nnoremap <leader>B _o binding.pry<ESC>
nnoremap <leader>w :w<CR>
nnoremap , <C-w>
let g:ctrlp_map = '<D-t>'
let g:move_key_modifier = 'C'
nmap <C-F> :Ag<SPACE>

"Insert mode mappings
imap <C-e> <Esc>
imap <C-c> <CR><Esc>O
imap <C-S-K> <ESC>O
imap <C-l> <right>
"CTRL-t plugin mappings
let g:ctrlp_map = '<leader>t'

"Visual mode expand regions
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
map <leader>n :NERDTreeToggle<CR>

"Command mode commands
command JSONformat execute !python -m json.tool

"NerdTree load on start
"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nu
set wmh=0
"set guifont=Monaco:h18
set guifont=mplus_1mn_regular:h15:b
set background=dark
colorscheme gruvbox
set autoread
" set ctags
set tags=./tags;
set nowrap
set nohlsearch
set list
set colorcolumn=80

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
