local templates = {
    m = {
        description = "Meeting notes",
        template = "\n* %^{PROMPT|Meeting|LOGGING WGM} %U \n\t- %?",
    },
    t = {
        description = "Task",
        template = "* BACKLOG %?\n  %u",
    },
}

local orgmode_opts = {
    org_agenda_files = { "~/workspace/orgspace/*" },
    org_default_notes_file = "~/workspace/orgspace/refile_work.org",
    win_split_mode = "auto",

    org_todo_keywords = { "BACKLOG(b)", "BLOCKED(x)", "HOLD", "PROGRESS", "REVIEW", "DONE" },
    org_todo_keyword_faces = {
        PROGRESS = ":foreground darkcyan",
        BLOCKED = ":foreground orange :slant italic",
        HOLD = ":foreground yellow :slant italic",
        REVIEW = ": foreground slateblue :slant italic",
        DONE = ":slant italic",
    },
    org_priority_highest = 1,
    org_priority_default = 2,
    org_priority_lowest = 3,
    org_hide_emphasis_markers = true,
    org_edit_src_content_indentation = 2,

    mappings = {
        prefix = "<leader>n",
        org = {
            org_set_tags_command = "cil",
            outline_up_heading = "t{",
        },
    },

    org_capture_templates = templates,
}

local function telescope_orgmode_config()
    local telescope = require("telescope")
    telescope.load_extension("orgmode")

    local function orgmode_telescope_maps()
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>fnr", telescope.extensions.orgmode.refile_heading, opts)
    end

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "org",
        group = vim.api.nvim_create_augroup("orgmode_telescope_nvim", { clear = true }),
        callback = orgmode_telescope_maps,
    })
end

return {
    {
        "nvim-orgmode/orgmode",
        dependencies = {
            "nvim-treesitter",
            "org-bullets.nvim",
            "headlines.nvim",
        },
        lazy = true,
        ft = "org",
        opts = orgmode_opts,
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "org*",
                callback = function()
                    vim.opt_local.conceallevel = 3
                end,
            })
        end,
        config = function(_, opts)
            require("orgmode").setup_ts_grammar()
            require("orgmode").setup(opts)
        end,
    },
    {
        "akinsho/org-bullets.nvim",
        dependencies = "nvim-treesitter",
        lazy = true,
        config = true,
    },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter",
        lazy = true,
        opts = { markdown = { headline_highlights = false }, },
    },
    {
        "joaomsa/telescope-orgmode.nvim",
        dependencies = { "telescope.nvim", "orgmode" },
        lazy = true,
        cmd = {
            "Telescope orgmode search_headings",
            "Telescope orgmode refile_heading"
        },
        config = telescope_orgmode_config,
        keys = {
            { "<leader>foh", ":Telescope orgmode search_headings<CR>", noremap = true, silent = true }
        }
    }
}
