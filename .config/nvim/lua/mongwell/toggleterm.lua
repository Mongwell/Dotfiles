local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

local function term_size(term)
    if term.direction == "horizontal" then
        return 20
    elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
    end
end

toggleterm.setup {
    size = term_size,
    open_mapping = [[<c-\>]],
    direction = "horizontal",
    hide_numbers = true,
    shade_terminals = true,
    persist_size = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    }
}

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end
