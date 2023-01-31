vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org*',
    callback = function ()
        vim.opt_local.colorcolumn = ""
        vim.opt_local.conceallevel = 3
    end
})

local org_ok, _ = pcall(require, "orgmode")
if not org_ok then
    return
end

local ts_ok, _ = pcall(require, "nvim-treesitter")
if not ts_ok then
    return
end

require "mongwell.org.orgmode"
require "mongwell.org.bullets"
require "mongwell.org.telescope-orgmode"
require "mongwell.org.headlines"
