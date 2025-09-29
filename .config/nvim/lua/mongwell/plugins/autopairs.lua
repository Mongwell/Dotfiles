local autopairs_opts = {
    enable_check_bracket_line = true,
    check_ts = true,
}

local function autopairs_config(_, setup_opts)
    local autopairs = require("nvim-autopairs")
    autopairs.setup(setup_opts)

    -- Add parentheses after selecting function or method item
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- These rules add space at end of pair. '( ' -> ' )' instead of ')'
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")
    autopairs.add_rules({
        -- Rule for a pair with left-side ' ' and right side ' '
        -- Pair will only occur if the conditional function returns true
        Rule(" ", " "):with_pair(function(opts)
            -- We are checking if we are inserting a space in (), [], or {}
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ "()", "[]", "{}" }, pair)
        end)
            :with_move(cond.none())
            :with_cr(cond.none())
        -- We only want to delete the pair of spaces when the cursor is as such: ( | )
            :with_del(function(opts)
                local col = vim.api.nvim_win_get_cursor(0)[2]
                local context = opts.line:sub(col - 1, col + 2)
                return vim.tbl_contains({ "(  )", "[  ]", "{  }" }, context)
            end)
    })

    local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
    for _, bracket in pairs(brackets) do
        autopairs.add_rules({
            Rule(bracket[1] .. " ", " " .. bracket[2])
                :with_pair(cond.none())
                :with_move(function(opts) return opts.char == bracket[2] end)
                :with_del(cond.none())
                :use_key(bracket[2])
                -- Removes the trailing whitespace that can occur without this
                :replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
        })
    end
end

-- Need to specify autopairs as a dependency for cmp. Adding this block here
-- in this file lets us do that, while keeping autopairs configuration separate
-- from cmp configuration.
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
