-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        "git", "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer...\nClose and reopen Neovim."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- Colorschemes
    use "navarasu/onedark.nvim"
    use "folke/tokyonight.nvim"
    use "rebelot/kanagawa.nvim"
    use "marko-cerovac/material.nvim"
    use "sainnhe/gruvbox-material"
    use "sainnhe/sonokai"
    use "glepnir/zephyr-nvim"

    -- Status Line
    use "glepnir/galaxyline.nvim"
    use { "akinsho/bufferline.nvim", requires = "moll/vim-bbye" }

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim"

    -- Completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- Nvim Tree
    use "kyazdani42/nvim-tree.lua"

    -- Telescope
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope.nvim",
        cmd = "Telescope", config = [[require("mongwell.telescope")]] }

    -- Git
    use "tpope/vim-fugitive"
    use "lewis6991/gitsigns.nvim"

    -- Various Tools
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use "akinsho/toggleterm.nvim"
    use { "echasnovski/mini.nvim", branch = "stable" }

    -- Fun
    use { "tjdevries/train.nvim",
        cmd = { "TrainClear", "TrainTextObj", "TrainUpDown", "TrainWord", } }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
