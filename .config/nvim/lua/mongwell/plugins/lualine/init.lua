local sep_l = require("mongwell.plugins.lualine.style").sep_l
local sep_r = require("mongwell.plugins.lualine.style").sep_r

local lualine_opts = {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = sep_l, right = sep_r, },
        disabled_filetypes = { statusline = { "alpha", "TelescopePrompt" },
        },
        ignore_focus = {},
        globalstatus = true,
        refresh = {
            statusline = 200,
        }
    },
    sections = require("mongwell.plugins.lualine.components").lualine_sections(sep_l, sep_r),
    extensions = { "fugitive", "lazy", "man", "nvim-tree", "toggleterm", "quickfix" },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
}
return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = true,
        event = "VeryLazy",
        opts = lualine_opts,
        init = function()
            vim.o.showmode = false
            vim.o.showcmd = false
            vim.o.shortmess = vim.o.shortmess .. "Sc"
        end,
        config = function(_, opts)
            local function refresh_hl()
                require("lualine").setup()
                require("mongwell.plugins.lualine.style").empty_shadow_hl()
            end
            refresh_hl()
            require("lualine").setup(opts)
            vim.api.nvim_create_autocmd("ColorScheme", { callback = refresh_hl })
        end
    },
}
