local options = {
    airline_theme = "onedark",
    airline_powerline_fonts = 1,
}

vim.cmd "let g:airline#extensions#tabline#enabled = 1"
vim.cmd "let g:airline#extensions#tabline#formatter = 'unique_tail'"
for k, v in pairs(options) do
    vim.g[k] = v
end
