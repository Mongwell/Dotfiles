set nocompatible              " be iMproved, required
filetype off                  " required

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/mongwell/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/mongwell/.config/nvim/dein')
  call dein#begin('/home/mongwell/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/mongwell/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  " Deoplete
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
  call dein#add('zchee/deoplete-clang')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('mhartington/oceanic-next')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-surround')
  call dein#add('Townk/vim-autoclose')
  call dein#add('majutsushi/tagbar.git')
  call dein#add('kien/ctrlp.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = ''  


call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'icymind/NeoSolarized'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'vim-syntastic/syntastic'

call plug#end()

"""""Keymappings""""

nmap <C-o> :NERDTreeToggle<CR>
nmap <C-k> :TagbarToggle<CR>:
nmap <C-p> :CtrlP<CR>

syntax on
colorscheme NeoSolarized
set background=dark

let g:airline_theme='base16_solarized'
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
