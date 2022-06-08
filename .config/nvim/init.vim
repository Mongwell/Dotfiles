"" Numbering
set relativenumber
set number

"" Tab spacing
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

"" History
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set hidden

"" Search
set ignorecase
set smartcase
set incsearch

set noerrorbells
set nowrap
set ruler
set scrolloff=10
set cursorline
set signcolumn=yes
set colorcolumn=80
set matchpairs+=<:>
set cmdheight=2
set updatetime=50



"" Plugins
call plug#begin('~/.vim/plugged')
""" Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'overcache/NeoSolarized'

""" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'brooth/far.vim'
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-web-devicons'

""" Fuzzy Find
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()


"" Plugin Configuration

""" LSP, Treesitter
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.html.setup{}
require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.pylsp.setup{ on_attach=require'completion'.on_attach }

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "python" },
    highlight = { enable = true },
    indent = { enable = true }
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

""" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_keepdir = 0

""" Airline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

""" Markdown Preview
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1

"" Colorscheme
set termguicolors
syntax on
set background=dark
let g:airline_theme='onedark'
colorscheme onedark

"" Mapping
let mapleader = " "
nnoremap <silent> <leader>l :noh<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gp :G push<CR>
nnoremap <leader>o :Lexplore<CR>
nnoremap <leader>vl :set scrollbind<CR>
nnoremap <leader>vu :set noscrollbind<CR>
nnoremap <leader>mp :MarkdownPreview<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" Autocommands
augroup MY_GROUP
    autocmd!
    autocmd BufWritePre * :call Format()
augroup END

"" Functions
fun! Format()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
    execute 'lua vim.lsp.buf.formatting()'
endfun
