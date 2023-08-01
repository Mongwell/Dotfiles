local ts_opts = {
    ensure_installed = {
        "bash",
        "c",
        "comment",
        "cmake",
        "cpp",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "json",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "org",
        "python",
        "regex",
        "rust",
        "toml",
        "yaml",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        use_languagetree = true,
        disable = { "" },
        additional_vim_regex_highlighting = { "org" },
    },
    autopairs = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { "python", "org", "yaml" },
    },
}


return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    cmd = {
        "TSInstall",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSInstallInfo",
        "TSInstallSync",
        "TSInstallFromGrammar",
    },
    event = { "BufReadPost", "BufNewFile" },
    init = function()
        vim.o.foldmethod = "expr"
        vim.o.foldexpr = "nvim_treesitter#foldexpr()"
        vim.o.foldenable = false
    end,
    opts = ts_opts,
    config = function (_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
