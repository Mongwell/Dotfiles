local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.load_extension('fzf')
telescope.load_extension('projects')

telescope.setup {
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
        }
    }
}
