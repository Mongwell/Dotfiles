local ts_opts = {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "csv",
        "cuda",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "json",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "requirements",
        "toml",
        "yaml",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { "yaml" },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}

local function treesitter_init()
    -- let treesitter decide how to fold
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = vim.treesitter.foldexpr()
    vim.o.foldenable = false -- do not fold everything on open
end

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    cmd = {
        "TSInstall",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSInstallInfo",
        "TSInstallSync",
        "TSInstallFromGrammar",
    },
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    init = treesitter_init,
    opts = ts_opts,
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
