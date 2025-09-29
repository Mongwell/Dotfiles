local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
    vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
end

local config_opts = {
    on_attach = on_attach,
    disable_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    view = {
        width = 30,
    },
    renderer = {
        highlight_git = true,
    },
}

return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,   -- recommended by nvim-tree docs
    dependencies = { "nvim-web-devicons" },
    opts = config_opts,
}
