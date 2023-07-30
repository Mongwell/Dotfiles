local o = vim.opt

vim.g.mapleader = " "

-- Numbering
o.relativenumber = true
o.number = true
o.numberwidth = 2

-- Tab spacing
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true

-- History
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true
o.hidden = true

-- Search
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true

o.errorbells = false
o.wrap = false
o.scrolloff = 10
o.sidescrolloff = 6
o.cursorline = true
o.signcolumn = "yes"
-- o.colorcolumn = "80"
o.updatetime = 50
o.mouse = "a"
o.splitbelow = true
o.splitright = true
o.completeopt = { "menuone", "preview", "noinsert", "noselect" }
o.termguicolors = true
o.matchpairs:append("<:>")
