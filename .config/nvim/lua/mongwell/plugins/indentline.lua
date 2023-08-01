local indentline_opts = {
    show_current_context = true,
    -- show_current_context = false, turn off if using indentscope
    use_treesitter = true,
    filetype_exclude = { "help", "org*" },
}

return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    opts = indentline_opts,
}
