local handlers = require("mongwell.lsp.handlers")

local M = {}

M.opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
}

M.setup_handler = function (server)
    require("lspconfig")[server].setup(M.opts)
end

return M
