local M = {}

M.mappings = {
    {
        mode = "n",
        keybind = "K",
        required_method = "textDocument/hover",
        callback = function() vim.lsp.buf.hover({ border = "rounded" }) end
    },
    {
        mode = "n",
        keybind = "gd",
        required_method = "textDocument/definition",
        callback = vim.lsp.buf.definition,
    },
    {
        mode = "n",
        keybind = "gD",
        required_method = "textDocument/declaration",
        callback = vim.lsp.buf.declaration,
    },
    {
        mode = "n",
        keybind = "gi",
        required_method = "textDocument/implementation",
        callback = vim.lsp.buf.implementation,
        default_map = { mode = "n", keybind = "gri" },
    },
    {
        mode = "n",
        keybind = "<leader>rn",
        required_method = "textDocument/rename",
        callback = vim.lsp.buf.rename,
        default_map = { mode = "n", keybind = "grn" },
    },
    {
        mode = "n",
        keybind = "gr",
        required_method = "textDocument/references",
        callback = vim.lsp.buf.references,
        default_map = { mode = "n", keybind = "grr" },
    },
    {
        mode = "n",
        keybind = "<leader>ca",
        required_method = "textDocument/codeAction",
        callback = vim.lsp.buf.code_action,
        default_map = { mode = "n", keybind = "gra" },
    }
}

M.once = function ()
    for _, mapping in ipairs(M.mappings) do
        -- remove neovim existing defaults mapping
        if mapping.default_map then
            vim.keymap.del(mapping.default_map.mode, mapping.default_map.keybind)
        end
    end
end

-- iterate through mappings table to set LSP functionality dependent keymaps
M.on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    for _, mapping in ipairs(M.mappings) do
        -- only create the keymap if client supports the functionality
        if client:supports_method(mapping.required_method) then
            vim.keymap.set(mapping.mode, mapping.keybind, mapping.callback, opts)
        end
    end
end

return M
