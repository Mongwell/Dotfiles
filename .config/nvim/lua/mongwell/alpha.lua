local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "n", "  New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  Find file", ":cd $HOME/workspace | Telescope find_files<CR>"),
    dashboard.button( "p", "  Projects",  ":Telescope projects theme=dropdown<CR>"),
    dashboard.button( "r", "  Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "t", "פּ  File tree", ":NvimTreeToggle<CR>" ),
    dashboard.button( "q", "  Quit", ":qa<CR>"),
}

alpha.setup(dashboard.config)
