-- Filter for unwanted buffers, filetypes, or other rules.
local function buffer_filter(buf_num, _)
    -- filter out filetypes you don't want to see
    local unwanted_fts = { ["fugitive"] = true, ["gitcommit"] = true, ["nil"] = true }

    -- filter out by buffer name
    local unwanted_bufnames = {}

    local ft = vim.bo[buf_num].filetype
    if unwanted_fts[ft] then
        return false
    end

    local bufname = vim.fn.bufname(buf_num)
    if unwanted_bufnames[bufname] then
        return false
    end
    return true
end

local function bufferline_opts()
    local bufferline = require("bufferline")
    local opts = {
        always_show_bufferline = false,
        separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
        style_preset = bufferline.style_preset.no_italic,
        close_command = function() require("mini.bufremove").delete(0, false) end,
        right_mouse_command = function() require("mini.bufremove").delete(0, false) end,

        show_close_icon = false,

        custom_filter = buffer_filter,

        -- when bufferline is active and vertical splits like NvimTree are toggled on,
        -- this adds a filler text to the horizontal row above that vsplit. basically
        -- keep bufferline from spilling over to side splits
        offsets = {
            {
                filetype = "undotree",
                text = "Undotree",
            },
            {
                filetype = "NvimTree",
                text = "NvimTree",
            },
            {
                filetype = "lazy",
                text = "Lazy",
            },
        }
    }
    return { options = opts }
end

return {
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-web-devicons", "scope.nvim" },
        lazy = true,
        event = "VeryLazy",
        opts = bufferline_opts,
    },
    {
        "echasnovski/mini.bufremove",
        lazy = true,
        keys = {
            { "<leader>q", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
            { "<leader>Q", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
        },
    },
    { "tiagovla/scope.nvim", lazy = true, config = true },
}
