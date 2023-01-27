local org_ok, _ = pcall(require, "orgmode")
if not org_ok then
    return
end

local ts_ok, _ = pcall(require, "nvim-treesitter")
if not ts_ok then
    return
end

require "mongwell.org.orgmode"
require "mongwell.org.bullets"
require "mongwell.org.telescope-orgmode"
require "mongwell.org.headlines"
