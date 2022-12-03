function Format()
    local save = vim.fn.winsaveview()
    vim.cmd [[ keeppatterns %s/\s\+$//e ]]
    vim.fn.winrestview(save)
    vim.lsp.buf.format()
end

-- Credit iago-lito
-- https://vi.stackexchange.com/questions/4575/merge-blocks-by-interleaving-lines
function InterleaveVisual()
    local block_start = unpack(vim.api.nvim_win_get_cursor(0))
    vim.cmd("normal! gvo\\<esc>")
    local block_end = unpack(vim.api.nvim_win_get_cursor(0))
    local block = {block_start, block_end}
    table.sort(block)
    local block_size = (block[2] - block[1] + 1) / 2
    for i = 0, block_size - 1, 1 do
        vim.cmd((block[1] + block_size + i) .. "move" .. (block[1] + 2 * i))
    end
end

-- Credit Sato Katsura:
-- https://vi.stackexchange.com/questions/4575/merge-blocks-by-interleaving-lines
function Interleave(block_start, block_end, where)
    if (block_start < where) then
        for i = 0, block_end - block_start, 1 do
            local dest = where+i
            vim.cmd(block_start .. "move" .. dest)
        end
    else
        for i = block_end - block_start, 0, -1 do
            local dest = where + i
            vim.cmd(block_end .. "move" .. dest)
       end
    end
end
