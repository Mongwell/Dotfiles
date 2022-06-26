local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local glyphs = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
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

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    open_on_tab = false,
    hijack_cursor = true,
    sync_root_with_cwd = true,
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
        relativenumber = true, -- looks ugly but good for getting around
        mappings = {
            custom_only = false,
            list = {
                { key = "v", action = "vsplit" },
                { key = "h", action = "split" },
                { key = "t", action = "tabnew" },
            },
        },
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

            }
        }
    },
}
