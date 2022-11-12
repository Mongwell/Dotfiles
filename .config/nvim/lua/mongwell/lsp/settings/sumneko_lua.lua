local defaults = require("mongwell.lsp.settings.defaults")

local M = {}

M.opts = {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                },
            },
        },
    }
}

M.setup_handler = function()
    local full_opts = vim.tbl_deep_extend("force", M.opts, defaults.opts)
    require("lspconfig").sumneko_lua.setup(full_opts)
end

return M
