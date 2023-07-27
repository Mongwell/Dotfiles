local glyphs = {
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
}

local diagnostics = {
	enable = true,
	icons = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	},
}

local config_opts = {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = false,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = diagnostics,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	git = {
		enable = true,
		ignore = true,
	},
	view = {
		width = 30,
		adaptive_size = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			glyphs = glyphs,
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
		},
	},
}

return {
	"nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-web-devicons" },
	opts = config_opts,
}
