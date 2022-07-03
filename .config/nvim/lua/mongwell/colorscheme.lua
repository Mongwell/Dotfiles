local colorscheme = "tokyonight"

-- Options
vim.g.tokyonight_style = "storm"
vim.g.sonokai_style = "andromeda"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("Color scheme " .. colorscheme .. " not found!")
    return
end
