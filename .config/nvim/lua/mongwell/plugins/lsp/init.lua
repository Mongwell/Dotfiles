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


local lsp_opts_map = {
    ["lua_ls"] = require("mongwell.plugins.lsp.settings.lua_ls"),
    ["pylsp"] = require("mongwell.plugins.lsp.settings.pylsp"),
    ["clangd"] = require("mongwell.plugins.lsp.settings.clangd"),
}

local function configure_servers()
    for lsp_name, lsp_opts in pairs(lsp_opts_map) do
        vim.lsp.config(lsp_name, lsp_opts)
    end
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim" },
        lazy = true,
        event = { "BufReadPre", "BufWritePost", "BufNewFile" },
        config = function()
            require("mongwell.plugins.lsp.handlers").setup()
            configure_servers()
        end,
    },
    {
        "mason-org/mason.nvim",
        lazy = true,
        opts = mason_opts,
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        cmd = { "LspInstall", "LspUninstall" },
        lazy = true,
        opts = masonlsp_opts,
    },
}
