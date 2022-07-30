local colorscheme = "kanagawa"

-- Options
vim.g.tokyonight_style = "night"
vim.g.sonokai_style = "andromeda"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("Color scheme " .. colorscheme .. " not found!")
    return
end
