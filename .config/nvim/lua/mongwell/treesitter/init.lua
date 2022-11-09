local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

require "mongwell.treesitter.config"
require "mongwell.treesitter.context"
