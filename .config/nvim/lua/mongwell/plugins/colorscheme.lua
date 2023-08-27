local scheme_plugins = {
    {
        plugin = "rebelot/kanagawa.nvim",
        name = "kanagawa",
        opts = { colors = { theme = { all = { ui = { bg_gutter = "none" } } } } },
    },
    {
        plugin = "folke/tokyonight.nvim",
        name = "tokyonight",
        opts = { style = "night" }
    },
    { plugin = "sainnhe/gruvbox-material",    name = "gruvbox-material" },
    { plugin = "sainnhe/sonokai",             name = "sonokai" },
    { plugin = "sainnhe/everforest",          name = "everforest" },
    { plugin = "rose-pine/neovim",            name = "rose-pine" },
    { plugin = "catppuccin/nvim",             name = "catppuccin" },
    { plugin = "edeneast/nightfox.nvim",      name = "nightfox" }
}

local M = {}
for _, scheme in pairs(scheme_plugins) do
    table.insert(M, {
        scheme.plugin,
        name = scheme.name,
        lazy = vim.g.colorscheme ~= scheme.name,
        priority = 1000,
        event = vim.g.colorscheme ~= scheme.name and nil or "VeryLazy",
        opts = scheme.opts,
        config = function(_, opts)
            if scheme.opts then
                require(scheme.name).setup(opts)
            end
            if vim.g.colorscheme == scheme.name then
                vim.cmd.colorscheme(scheme.name)
            end
        end
    })
end

return M
