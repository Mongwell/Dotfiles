local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffers
keymap("n", "]b", ":bnext<CR>", opts)
keymap("n", "[b", ":bprevious<CR>", opts)
keymap("n", "<leader>q", ":Bdelete<CR>", opts)
keymap("n", "<leader>w", ":Bwipeout<CR>", opts)

-- Clear search
keymap("n", "<leader>l", ":noh<CR>", opts)

-- Scroll bind splits
keymap("n", "<leader>vl", ":set scrollbind<CR>", opts)
keymap("n", "<leader>vu", ":set noscrollbind<CR>", opts)

-- Paste output of :messages to buffer
keymap("n", "<leader>pm", ":put =execute('messages')<CR>", opts)

-- LSP related
keymap("n", "<leader>fmt", ":lua Format()<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fc", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>fgf", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>fgc", ":Telescope git_commits<CR>", opts)
keymap("n", "<leader>fgh", ":Telescope git_bcommits<CR>", opts)
keymap("n", "<leader>fgb", ":Telescope git_branches<CR>", opts)
keymap("n", "<leader>fd", ":Telescope diagnostics<CR>", opts)
keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)
keymap("n", "<leader>fk", ":Telescope treesitter<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects theme=dropdown<CR>", opts)

-- Fugitive
keymap("n", "<leader>gs", ":G<CR>", opts)
keymap("n", "<leader>gp", ":G push<CR>", opts)
keymap("n", "<leader>gvd", ":Gvdiffsplit<CR>", opts)
keymap("n", "<leader>gl", ":G log<CR>", opts)

-- Gitsigns
keymap("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)
keymap("n", "<leader>gdt", ":Gitsigns toggle_deleted<CR>", opts)
keymap("n", "<leader>hP", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>hn", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>hp", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "<leader>hr", ":Gitsigns undo_stage_hunk<CR>", opts)
keymap("n", "<leader>gds", ":Gitsigns diffthis<CR>", opts)

-- Toggleterm
keymap("n", "<C-g>", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<C-p>", ":lua _IPY_TOGGLE()<CR>", opts)
keymap("v", "<leader>x", ":ToggleTermSendVisualSelection 1<CR>", opts)
keymap("n", "<leader>x", ":ToggleTermSendCurrentLine 1<CR>", opts)

--UndoTree
keymap("n", "<leader>ut", ":UndotreeToggle<CR>", opts)

-- Glow Markdown Preview
keymap("n", "<leader>mp", ":Glow<CR>", opts)

-- Trainer
keymap("n", "<leader>trh", ":TrainUpDown<CR>", opts)
keymap("n", "<leader>trw", ":TrainWord<CR>", opts)
keymap("n", "<leader>tro", ":TrainTextObj<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Don't yank to register when pasting in visual mode
keymap("v", "p", '"_dP', opts)

-- Interleave function
keymap("v", "li", "<esc>:lua InterleaveVisual()<CR><esc>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
