return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
	{ "navarasu/onedark.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true, opts = { style = "night" } },
	{ "marko-cerovac/material.nvim", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },
	{ "glepnir/zephyr-nvim", lazy = true },
	{ "sainnhe/sonokai", lazy = true },
}
