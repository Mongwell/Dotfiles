local function telescope_opts()
    local actions = require("telescope.actions")
    return {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            path_display = { "smart" },

            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,

                    ["<C-h>"] = actions.select_horizontal,

                    ["<C-e>"] = actions.close,
                },
            },
        },

        pickers = {
            find_files = {
                theme = "dropdown",
                hidden = true,
            },
            buffers = {
                theme = "dropdown",
            },
            git_files = {
                theme = "dropdown",
            },
            git_bcommits = {
                theme = "dropdown",
            },
            diagnostics = {
                theme = "ivy",
            },
            lsp_references = {
                theme = "ivy",
            },
        },

        extensions = {
            fzf = {
                override_generic_sorter = true,
            },
        },
    }
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    lazy = true,
    cmd = "Telescope",
    opts = telescope_opts,
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("fzf")
        pcall(telescope.load_extension("projects"))
    end,
}
