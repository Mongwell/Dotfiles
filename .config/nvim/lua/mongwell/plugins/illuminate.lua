local illum_opts = {
    delay = 200,
    filetypes_denylist = {
        "far",
        "fugitive",
        "gitcommit",
        "alpha",
        "NvimTree",
        "lazy",
        "toggleterm",
        "DressingSelect",
        "TelescopePrompt",
    }
}
return {
    "RRethy/vim-illuminate",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    opts = illum_opts,
    config = function(_, opts)
        require("illuminate").configure(opts)
    end
}
