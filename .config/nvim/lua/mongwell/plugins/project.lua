local project_opts = {
	manual_mode = false,
	detection_methods = { "lsp", "pattern" },
	patterns = { "=orgspace" },
	exclude_dirs = {},
}

return {
	"telescope.nvim",
	dependencies = {
		"ahmedkhalf/project.nvim",
		lazy = true,
		opts = project_opts,
		cmd = "Telescope projects",
		config = function(_, opts)
			require("project_nvim").setup(opts)
			require("telescope").load_extension("projects")
		end,
	},
}
