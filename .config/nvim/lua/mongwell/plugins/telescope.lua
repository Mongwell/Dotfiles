local telescope_opts = {
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		mappings = {
			i = {
				["<C-n>"] = require("telescope.actions").cycle_history_next,
				["<C-p>"] = require("telescope.actions").cycle_history_prev,

				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,

				["<C-h>"] = require("telescope.actions").select_horizontal,

				["<C-e>"] = require("telescope.actions").close,
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
		},
	},
}

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	lazy = true,
	cmd = "Telescope",
	opts = telescope_opts,
	config = function(_, opts)
		require("telescope").setup(opts)
        require("telescope").load_extension('fzf')
	end,
}
