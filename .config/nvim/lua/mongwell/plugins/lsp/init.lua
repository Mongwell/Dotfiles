local mason_opts = {
	ui = {
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = "",
		},
	},
}

local masonlsp_opts = {
	ensure_installed = { "lua_ls", "pylsp" },
}

local setup_handlers_config = {
	require("mongwell.plugins.lsp.settings.defaults").setup_handler,
	["lua_ls"] = require("mongwell.plugins.lsp.settings.lua_ls").setup_handler,
	["pylsp"] = require("mongwell.plugins.lsp.settings.pylsp").setup_handler,
	["clangd"] = require("mongwell.plugins.lsp.settings.clangd").setup_handler,
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-lspconfig.nvim", "cmp-nvim-lsp" },
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mongwell.plugins.lsp.handlers").setup()
			require("mason-lspconfig").setup_handlers(setup_handlers_config)
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		opts = mason_opts,
        build = ":MasonUpdate",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		lazy = true,
		opts = masonlsp_opts,
	},
}
