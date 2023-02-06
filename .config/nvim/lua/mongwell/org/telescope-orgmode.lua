local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
    return
end

local ext_ok, _ = pcall(function() telescope.load_extension("orgmode") end)
if not ext_ok then
    return
end

local function orgmode_telescope_maps()
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>fnr', telescope.extensions.orgmode.refile_heading, opts)
end
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    group = vim.api.nvim_create_augroup('orgmode_telescope_nvim', { clear = true }),
    callback = orgmode_telescope_maps,
})

-- Specific mappings
vim.keymap.set('n', '<leader>foh', telescope.extensions.orgmode.search_headings)
