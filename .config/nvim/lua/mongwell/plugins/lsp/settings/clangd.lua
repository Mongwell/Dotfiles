local defaults = require("mongwell.plugins.lsp.settings.defaults")

local M = {}

M.opts = {
    capabilities = {
        offsetEncoding = "utf-8"
    }
}

M.setup_handler = function ()
    local full_opts = vim.tbl_deep_extend("force", M.opts, defaults.opts)
    require("lspconfig").clangd.setup(full_opts)
end

return M
