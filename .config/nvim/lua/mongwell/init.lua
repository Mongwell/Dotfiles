require("mongwell.options")
require("mongwell.functions")

vim.g.colorscheme = "catppuccin"

-- bootstrap lazy package manager
require("mongwell.bootstrap")

-- configure plugins if bootstrap succeeded
local status_ok, lazy = pcall(require, "lazy")
if status_ok then
    local lazy_opts = { change_detection = { notify = false } }
    lazy.setup("mongwell.plugins", lazy_opts)
end

require("mongwell.keymaps")
