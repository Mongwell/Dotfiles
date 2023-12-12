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

local function diagnostics_indicator(_, _, diagnostics, _)
    local result_comps = {}
    local symbols = {
        error = "󰅚",
        warning = "󰀪",
        info = "󰋽",
    }
    for name, count in pairs(diagnostics) do
        if symbols[name] and count > 0 then
            table.insert(result_comps, symbols[name])
        end
    end
    local result = table.concat(result_comps, " ")
    return #result > 0 and result or ""
end

local function bufferline_opts()
    local bufferline = require("bufferline")
    local opts = {
        always_show_bufferline = false,
        separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
        sort_by = "insert_at_end",
        style_preset = { bufferline.style_preset.minimal, bufferline.style_preset.no_italic },
        close_command = function() require("mini.bufremove").delete(0, false) end,
        right_mouse_command = function() require("mini.bufremove").delete(0, false) end,

        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        indicator = {
            style = "icon",
            icon = "▎",
        },
        show_close_icon = false,

        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = diagnostics_indicator,

        custom_filter = buffer_filter,

        offsets = {
            {
                filetype = "undotree",
                text = "Undotree",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "NvimTree",
                text = "NvimTree",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "DiffviewFiles",
                text = "Diff View",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "lazy",
                text = "Lazy",
                highlight = "PanelHeading",
                padding = 1,
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
