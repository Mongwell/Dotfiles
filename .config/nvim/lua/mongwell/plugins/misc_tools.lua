local undotree_opts = {
    undotree_WindowLayout = 3,
    undotree_ShortIndicators = 1,
    undotree_SetFocusWhenToggle = 1,
}

return {
    {
        "mbbill/undotree",
        lazy = true,
        cmd = { "UndotreeToggle", "UndotreeShow" },
        config = function()
            for k, v in pairs(undotree_opts) do
                vim.g[k] = v
            end
        end,
    },
    {
        "brooth/far.vim",
        lazy = true,
        cmd = { "Far", "F", "Farp", "Farr", "Farf", "Refar", "Fardo", "Farundo" },
    },
}
