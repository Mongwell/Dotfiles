function Format()
    local save = vim.fn.winsaveview()
    vim.cmd [[ keeppatterns %s/\s\+$//e ]]
    vim.fn.winrestview(save)
    vim.lsp.buf.format()
end