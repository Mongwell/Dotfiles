local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

-- Filter to only show buffers that are open in the current tab.
-- Makes tabs 'feel like' workspaces.
local function buffer_active_in_tab(buf, buf_nums)
    -- get the current tab page number
    local current_tab = vim.api.nvim_get_current_tabpage()
    -- get a list of buffers for a specific tab
    local tab_buffers = vim.fn.tabpagebuflist(current_tab)
    -- check if the current buffer is being viewed in the current tab
    return vim.tbl_contains(tab_buffers, buf)
end

-- Filter for unwanted buffers, filetypes, or other rules.
local function unwanted_filter(buf_num, buf_nums)
    -- filter out filetypes you don't want to see
    local unwanted_fts = { ["fugitive"] = true, }

    -- filter out by buffer name
    local unwanted_bufnames = {}

    local ft = vim.bo[buf_num].filetype
    if unwanted_fts[ft] ~= nil then
        return false
    end

    local bufname = vim.fn.bufname(buf_num)
    if unwanted_bufnames[bufname] ~= nil then
        return false
    end

    return true
end

bufferline.setup {
    options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",

        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        indicator = {
            style = "icon",
            icon = '▎'
        },

        max_name_length = 30,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 20,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        -- diagnostics_indicator = ,

        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = unwanted_filter,
        offsets = { { filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
        } },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,

        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "slant", -- "slant" | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
    },
}
