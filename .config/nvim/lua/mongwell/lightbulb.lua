local status_ok, lightbulb = pcall(require, "nvim-lightbulb")
if not status_ok then
    return
end

-- vim.diagnostic.config({signs = false})
-- vim.diagnostic.config({virtual_text = false})

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
lightbulb.setup {
    sign = {
        enabled = true,
        priority = 12,
    },
    autocmd = {
        enabled = true
    }
}
