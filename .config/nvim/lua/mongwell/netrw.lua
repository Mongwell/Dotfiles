local options = {
    netrw_banner = 0,
    netrw_liststyle = 3,
    netrw_browse_split = 4,
    netrw_altv = 1,
    netrw_winsize = 20,
    netrw_keepdir = 0,
}

for k, v in pairs(options) do
    vim.g[k] = v
end
