local defaults = require("mongwell.plugins.lsp.settings.defaults")

local M = {}

M.opts = {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 100,
                },
            },
        },
    },
}

M.setup_handler = function()
    local full_opts = vim.tbl_deep_extend("force", M.opts, defaults.opts)
    require("lspconfig").pylsp.setup(full_opts)
end

return M
