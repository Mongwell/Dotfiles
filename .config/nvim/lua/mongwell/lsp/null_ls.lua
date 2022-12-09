local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    sources = {
        -- Add sources here as needed
        diagnostics.cpplint,
        -- formatting.clang_format.with { extra_args = { "--Werror", "--style", "{IndentWidth: 4}" } },

        diagnostics.pydocstyle,
        diagnostics.pylint,
        formatting.black.with({ extra_args = { "--fast", "--line-length", "100" } })
    }
}
