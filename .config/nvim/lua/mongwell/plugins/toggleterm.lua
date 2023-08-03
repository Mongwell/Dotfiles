local function term_size(term)
    if term.direction == "horizontal" then
        return 15
    elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
    end
end

local toggleterm_opts = {
    size = term_size,
    open_mapping = [[<c-\>]],
    direction = "float",
    hide_numbers = true,
    shade_terminals = true,
    persist_size = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
    },
}

local function toggleterm_init()
    vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
            local map_opts = { buffer = 0, noremap = true, silent = true }
            local keymap = vim.keymap.set
            keymap("t", "<esc>", [[<C-\><C-n>]], map_opts)
            keymap("t", "jk", [[<C-\><C-n>]], map_opts)
            keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], map_opts)
            keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], map_opts)
            keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], map_opts)
            keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], map_opts)
        end,
    })
end

local function toggleterm_config(_, opts)
    require("toggleterm").setup(opts)

    local Terminal = require("toggleterm.terminal").Terminal
    local ipython = Terminal:new({ cmd = "ipython", hidden = true, direction = "vertical" })

    local function ipy_toggle()
        ipython:toggle()
    end

    vim.keymap.set({ "n", "t" }, "<M-p>", ipy_toggle, { noremap = true, silent = true })
end


return {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = {
        "ToggleTerm",
        "TermExec",
        "ToggleTermToggleAll",
        "ToggleTermSendCurrentLine",
        "ToggleTermSendVisualLines",
        "ToggleTermSendVisualSelection",
    },
    keys = { { "<M-p>", desc = "Toggle IPython" }, { toggleterm_opts.open_mapping, desc = "Toggle terminal" } },
    opts = toggleterm_opts,
    init = toggleterm_init,
    config = toggleterm_config,
}
