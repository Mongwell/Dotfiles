require("mongwell.options")
require("mongwell.functions")

vim.g.colorscheme = "kanagawa"

local lazy_opts = {
    change_detection = {
        notify = false,
    }
}
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
require("mongwell.bootstrap").lazy_setup(lazypath)
local status_ok, lazy = pcall(require, "lazy")
if status_ok then
    lazy.setup("mongwell.plugins", lazy_opts)
end

require("mongwell.keymaps")
