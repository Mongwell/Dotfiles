local config_opts = {
    input = {
        enabled = true,
        insert_only = false,

        mappings = {
            i = {
                ["<C-e>"] = "Close",
            }
        }
    },
    select = {
        enabled = true,
        trim_prompt = false,
    }
}

return {
    "stevearc/dressing.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = config_opts,
}
