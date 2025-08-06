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

-- wrap together several on_attach calls
local function on_attach_wrapper(client, bufnr)
    local keymap_cfg = require("mongwell.plugins.lsp.keymaps")
    keymap_cfg.on_attach(client, bufnr)

    -- ensures breadcrumbs works with multiple tabs
    local have_navic, navic = pcall(require, "nvim-navic")
    if have_navic and client.server_capabilities["documentSymbolProvider"] then
        navic.attach(client, bufnr)
    end
end

-- configure server capabilities and 'on_attach' behavior
local function configure_servers()
    -- extend default client capabilities with those from 'nvim-cmp'
    -- enables autocompletions to pull from LSP, if 'nvim-cmp' is installed
    local default_capabilities = vim.lsp.protocol.make_client_capabilities()
    local have_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if have_cmp then
        local cmp_capabilities = cmp_nvim_lsp.default_capabilities()
        default_capabilities = vim.tbl_deep_extend(
            "force",
            default_capabilities,
            cmp_capabilities
        )
    end

    local keymap_cfg = require("mongwell.plugins.lsp.keymaps")
    keymap_cfg.once()
    local default_opts = {
        on_attach = on_attach_wrapper,
        capabilities = default_capabilities,
    }

    local server_opts_map = {
        ["*"] = default_opts,
        ["lua_ls"] = require("mongwell.plugins.lsp.settings.lua_ls"),
        ["pylsp"] = require("mongwell.plugins.lsp.settings.pylsp"),
        ["clangd"] = require("mongwell.plugins.lsp.settings.clangd"),
    }

    for lsp_name, server_opts in pairs(server_opts_map) do
        local full_opts = vim.tbl_deep_extend("force", default_opts, server_opts)
        vim.lsp.config(lsp_name, full_opts)
    end
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim", "cmp-nvim-lsp" },
        lazy = true,
        event = { "BufReadPre", "BufWritePost", "BufNewFile" },
        config = function()
            require("mongwell.plugins.lsp.diagnostics").configure()
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
