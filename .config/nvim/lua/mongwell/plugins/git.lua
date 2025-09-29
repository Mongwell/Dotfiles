local gitsigns_opts = {
    signs = {
        changedelete = { text = '┃' },
        delete       = { text = "" },
        topdelete    = { text = "" },
    },
    signs_staged = {
        changedelete = { text = '┃' },
        delete       = { text = "" },
        topdelete    = { text = "" },
    },
    attach_to_untracked = true,
    preview_config = {
        -- Options passed to nvim_open_win
        border = "rounded",
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
