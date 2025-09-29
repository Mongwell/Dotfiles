local indentline_opts = {
    scope = {
        enabled = false,
    },
    exclude = {
        filetypes = { "help", "yaml", "yml" },
    }
}

return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "nvim-treesitter" },
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    opts = indentline_opts,
    main = "ibl",
}
