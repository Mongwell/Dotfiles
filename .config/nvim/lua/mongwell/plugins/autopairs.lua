local autopairs_opts = {
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "Comment",
    },
}

local function autopairs_config(_, setup_opts)
    local autopairs = require("nvim-autopairs")
    autopairs.setup(setup_opts)
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())

    local Rule = require("nvim-autopairs.rule")
    autopairs.add_rules({
        Rule(" ", " "):with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ "()", "[]", "{}" }, pair)
        end),
        Rule("( ", " )")
            :with_pair(function()
                return false
            end)
            :with_move(function(opts)
                return opts.prev_char:match(".%)") ~= nil
            end)
            :use_key(")"),
        Rule("{ ", " }")
            :with_pair(function()
                return false
            end)
            :with_move(function(opts)
                return opts.prev_char:match(".%}") ~= nil
            end)
            :use_key("}"),
        Rule("[ ", " ]")
            :with_pair(function()
                return false
            end)
            :with_move(function(opts)
                return opts.prev_char:match(".%]") ~= nil
            end)
            :use_key("]"),
    })
end

return {
    "nvim-cmp",
    dependencies = {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "InsertEnter",
        opts = autopairs_opts,
        config = autopairs_config,
    },
}
