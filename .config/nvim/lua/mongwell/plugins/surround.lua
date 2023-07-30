local surround_opts = {
	custom_surroundings = nil,
	highlight_duration = 1500,
	mappings = {
		add = "sa",
		delete = "sd",
		find = "sf",
		find_left = "sF",
		highlight = "sh",
		replace = "sr",
		update_n_lines = "sn",
	},
	n_lines = 50,
	search_method = "cover",
}

local function surround_keys(_, keys)
	-- Populate the keys based on the user's options
	local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
	local opts = require("lazy.core.plugin").values(plugin, "opts", false)
	local mappings = {
		{ opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
		{ opts.mappings.delete, desc = "Delete surrounding" },
		{ opts.mappings.find, desc = "Find right surrounding" },
		{ opts.mappings.find_left, desc = "Find left surrounding" },
		{ opts.mappings.highlight, desc = "Highlight surrounding" },
		{ opts.mappings.replace, desc = "Replace surrounding" },
		{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
	}
	mappings = vim.tbl_filter(function(m)
		return m[1] and #m[1] > 0
	end, mappings)
	return vim.list_extend(mappings, keys)
end

return {
	"echasnovski/mini.surround",
    lazy = true,
	opts = surround_opts,
	keys = surround_keys,
}
