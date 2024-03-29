"\autoload
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Install LSP
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Syntax highlighting and more
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'mbbill/undotree'
Plug 'digitaltoad/vim-pug'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dag/vim-fish'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'rking/ag.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-vinegar'
Plug 'gcmt/taboo.vim'
Plug 'haya14busa/incsearch.vim' "search higlights
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/Tabmerge'

Plug 'garbas/vim-snipmate' "Make snippets
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets' "?
Plug 'bling/vim-airline'
Plug 'tpope/vim-sensible' "?
Plug 'tpope/vim-commentary' "make comments(usage: gcc gc)
Plug 'tpope/vim-surround' "ys + selector + braces type
Plug 'matze/vim-move' "move lines up and down
Plug 'Raimondi/delimitMate' "auto completion for bracket
Plug 'kien/ctrlp.vim' "Fuzzy search
Plug 'morhetz/gruvbox'
"JS
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tasn/vim-tsx'
Plug 'slashmili/alchemist.vim'
Plug 'chriskempson/base16-vim'
Plug 'janko/vim-test'
Plug 'skywind3000/asyncrun.vim'
Plug 'neomake/neomake'
Plug 'zivyangll/git-blame.vim'

call plug#end()

let mapleader = "\<Space>"

"undotree
nnoremap <leader>U :UndotreeToggle<CR>

if has("persistent_undo")
  set undodir=$HOME/.undodir
  set undofile
end

lua << EOF
-- `on_attach` callback will be called after a language server
-- instance has been attached to an open buffer with matching filetype
-- here we're setting key mappings for hover documentation, goto definitions, goto references, etc
-- you may set those key mappings based on your own preference
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

-- setting up the elixir language server
-- you have to manually specify the entrypoint cmd for elixir-ls
require('lspconfig').elixirls.setup {
  cmd = { "/Users/karavam/elixir-ls/language_server.sh" },

  on_attach = on_attach
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "heex", "eex"}, -- only install parsers for elixir and heex
  -- ensure_installed = "all", -- install parsers for all supported languages
  sync_install = false,
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { }
  }
}
EOF


"vim-test
let test#strategy = "asyncrun"
nnoremap <leader>N :TestNearest<CR>
nnoremap <leader>F :TestFile<CR>
nnoremap <leader>S :TestSuite<CR>
nnoremap <leader>L :TestLast<CR>
nnoremap <leader>V :TestVisit<CR>

"git-blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"vim-ag search configuration
"always start searching from your project root instead of the cwd 
let g:ag_working_path_mode="r"
"ignore tags folder for search
set wildignore+=tags/**

"set async quickfix window when task is running
let g:asyncrun_open = 10

"Run Neomake when I save any buffer
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
  " Don't tell me to use smartquotes in markdown ok?
  let g:neomake_markdown_enabled_makers = []

"Set wrap (break line if it's too long) in quickfix windows
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

"CTRLP options
set wildignore+=*/_build,*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Key mappings
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

"Command mode commands
" command JSONformat execute !python -m json.tool

"Settings
set noeb vb t_vb= " Disable beep sound
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nu
set wmh=0
set guifont=Monaco:h18

set autoread
" set ctags
set tags=./tags;
set nowrap
set hlsearch
set list

"cursor
" set cursorline
" set cursorcolumn
set title

" terraform configurations
let g:terraform_fmt_on_save = 1 "format before save
autocmd FileType terraform setlocal commentstring=#%s "comment type for tf files

"Netrw (like NerDTree) configs
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = -28
let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'

"Netrw toggle setup
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Sexplore!
    endif
endfunction

noremap <leader>n :call ToggleNetrw()<CR>

" incsearch config
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay
" :h g:incsearch#auto_nohlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#

"folding all except selected
vnoremap <Leader>za <Esc>`<kzfgg`>jzfG`< 

"Cursor. Line for insert mode and bar for all the rest.
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let g:snipMate = { 'snippet_version' : 1 }

"The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
