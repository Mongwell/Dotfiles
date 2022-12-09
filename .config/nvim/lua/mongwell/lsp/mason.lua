local status_ok_mason, mason = pcall(require, "mason")
if not status_ok_mason then
    return
end

local status_ok_masonlsp, masonlsp = pcall(require, "mason-lspconfig")
if not status_ok_masonlsp then
    return
end

mason.setup {
    ui = {
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "rounded",

        icons = {
            -- The list icon to use for installed packages.
            package_installed = "✓",
            -- The list icon to use for packages that are installing, or queued for installation.
            package_pending = "➜",
            -- The list icon to use for packages that are not installed.
            package_uninstalled = "✗"
        },
    },
}

masonlsp.setup {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = { "sumneko_lua" },
}

masonlsp.setup_handlers({
    require("mongwell.lsp.settings.defaults").setup_handler,
    ["sumneko_lua"] = require("mongwell.lsp.settings.sumneko_lua").setup_handler,
    ["pylsp"] = require("mongwell.lsp.settings.pylsp").setup_handler,
    ["clangd"] = require("mongwell.lsp.settings.clangd").setup_handler,
})
