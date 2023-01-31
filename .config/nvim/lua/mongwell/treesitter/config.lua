local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = { "org" },
    },
    autopairs = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { "python", "org" }
    },
}

-- --  Fold using treesitter, but disabled by default
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = 0
