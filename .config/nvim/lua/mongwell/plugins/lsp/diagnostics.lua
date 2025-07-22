local M = {}

-- configure LSP diagnostic settings
M.configure = function()
    local signs = {
        { name = "DiagnosticSignError", text = "󰅚" },
        { name = "DiagnosticSignWarn", text = "󰀪" },
        { name = "DiagnosticSignInfo", text = "󰋽" },
        { name = "DiagnosticSignHint", text = "󰌶" },
    }
    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {
            texthl = sign.name,
            text = sign.text,
            numhl = "",
        })
    end

    local config = {
        virtual_text = {
            severity = vim.diagnostic.severity.E,
        },
        signs = {
            active = signs,
        },
        update_in_insert = false,
        underline = false,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

return M
