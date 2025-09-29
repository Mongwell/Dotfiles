local scheme_plugins = {
    {
        plugin = "rebelot/kanagawa.nvim",
        name = "kanagawa",
        opts = {
            colors = {
                theme = {
                    all = {
                        -- remove background color of number column/sign gutter
                        ui = { bg_gutter = "none" }
                    }
                }
            }
        },
    },
    {
        plugin = "folke/tokyonight.nvim",
        name = "tokyonight",
        opts = { style = "night" }
    },
    {
        plugin = "catppuccin/nvim",
        name = "catppuccin",
        opts = { flavour = "macchiato" }
    },
    { plugin = "sainnhe/gruvbox-material", name = "gruvbox-material" },
    { plugin = "sainnhe/sonokai",          name = "sonokai" },
    { plugin = "sainnhe/everforest",       name = "everforest" },
    { plugin = "rose-pine/neovim",         name = "rose-pine" },
    { plugin = "edeneast/nightfox.nvim",   name = "nightfox" }
}

-- colorscheme config is pretty uniform, so we can auto generate it
local M = {}
for _, scheme in pairs(scheme_plugins) do
    table.insert(M, {
        scheme.plugin,
        name = scheme.name,
        lazy = vim.g.colorscheme ~= scheme.name,  -- lazy load all schemes except the active one
        priority = 1000,
        event = vim.g.colorscheme ~= scheme.name and nil or "VeryLazy",
        opts = scheme.opts,
        config = function(_, opts)
            if scheme.opts then
                require(scheme.name).setup(opts)
            end
            -- vim.g.colorscheme is just a global var. vim.cmd.colorscheme()
            -- will activate a colorscheme. manually calling it here allows
            -- us to set options (like default flavor) first
            if vim.g.colorscheme == scheme.name then
                vim.cmd.colorscheme(scheme.name)
            end
        end
    })
end

return M
