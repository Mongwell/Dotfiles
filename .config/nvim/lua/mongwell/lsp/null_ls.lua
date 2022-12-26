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
        diagnostics.cpplint.with({ args = { 
            "--filter", "-legal/copyright,-build/include_subdir,-build/include_order,-build/header_guard", "$FILENAME" } }),

        diagnostics.cmake_lint,
        formatting.cmake_format,

        diagnostics.pydocstyle,
        diagnostics.flake8.with({ extra_args = { "--max-line-length", "100" } }),
        formatting.black.with({ extra_args = { "--fast", "--line-length", "100" } })
    }
}
