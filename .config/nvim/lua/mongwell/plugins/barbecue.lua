local barbecue_opts = {
    show_dirname = true,
    show_basename = true,
}
return {
    "utilyre/barbecue.nvim",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-web-devicons",
    },
    lazy = true,
    cmd = "Barbecue",
    event = "VeryLazy",
    opts = barbecue_opts,
}
