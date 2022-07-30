local options = {
    -- Numbering
    relativenumber = true,
    number = true,

    -- Tab spacing
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,
    smartindent = true,

    -- History
    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    hidden = true,

    -- Search
    ignorecase = true,
    smartcase = true,
    incsearch = true,

    errorbells = false,
    wrap = false,
    ruler = true,
    scrolloff = 10,
    sidescrolloff = 6,
    cursorline = true,
    signcolumn = "yes",
    colorcolumn = "80",
    cmdheight = 2,
    updatetime = 50,
    mouse = "a",
    showtabline = 2,
    splitbelow = true,
    splitright = true,
    completeopt = { "menuone", "preview", "noinsert", "noselect" },
    hlsearch = true,
    termguicolors = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set matchpairs+=<:>"
vim.cmd "set iskeyword-=_"
