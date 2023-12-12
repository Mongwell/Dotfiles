local function alpha_config()
    local dashboard = require("alpha.themes.dashboard")
    -- Set menu
    dashboard.section.buttons.val = {
        dashboard.button("n", "󰻭  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "󰮗  Find file", ":cd $HOME/workspace | Telescope find_files<CR>"),
        dashboard.button("p", "  Projects", ":Telescope projects theme=dropdown<CR>"),
        dashboard.button("r", "󰋚  Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("t", "󰙅  File tree", ":NvimTreeToggle<CR>"),
        dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
    }

    require("alpha").setup(dashboard.config)
end

return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-web-devicons" },
    lazy = true,
    event = "VimEnter",
    config = alpha_config,
}
