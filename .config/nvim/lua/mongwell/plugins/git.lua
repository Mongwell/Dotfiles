local gitsigns_opts = {
    signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "󰍵" },
        topdelete = { text = "󰍵" },
        changedelete = { text = "▎" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
}

local conflict_opts = {
    disable_diagnostics = true,
    default_mappings = {
        next = ']c',
        prev = '[c',
    },
}

return {
    {
        "tpope/vim-fugitive",
        lazy = true,
        cmd = { "G", "Git", "Gvdiffsplit" },
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        opts = gitsigns_opts,
    },
    {
        "akinsho/git-conflict.nvim",
        lazy = true,
        event = { "BufReadPost", "BufNewFile" },
        opts = conflict_opts,
    }
}
