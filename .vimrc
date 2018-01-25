set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neco-syntax'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'wokalski/autocomplete-flow'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'fszymanski/deoplete-emoji'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'vim-syntastic/syntastic'

Plug 'vim-airline/vim-airline-themes'
Plug 'mhartington/oceanic-next'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'icymind/NeoSolarized'
Plug 'joshdick/onedark.vim'
call plug#end()

"""""Keymappings""""

nmap <C-o> :NERDTreeToggle<CR>
nmap <C-k> :TagbarToggle<CR>
nmap <C-p> :CtrlP<CR>
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

imap <expr><CR> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : pumvisible() ?
            \ "\<C-y>" : "\<CR>"

""""""""""""""""""""

syntax on
colorscheme OceanicNext
set background=dark

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#sources#rust#racer_binary='which racer'
let g:deoplete#sources#rust#rust_source_path='~/rust/src'
let g:deoplete#sources#rust#show_duplicates=1
autocmd CompleteDone * pclose!


let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang/5.0.1/include'

let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = ''  
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

set number
set termguicolors
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
