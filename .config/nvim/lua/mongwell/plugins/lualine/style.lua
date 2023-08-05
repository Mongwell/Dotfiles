local sep_style = "reversed"
local sep_icons = {
    default = { left = " ", right = "" },
    reversed = { left = "", right = "" },
    round = { left = "", right = "" },
    block = { left = "█", right = "█" },
    arrow = { left = "", right = "" },
}

M = {
    sep_l = sep_icons[sep_style].left,
    sep_r = sep_icons[sep_style].right
}

M.empty_shadow_hl = function()
    local bg_a = vim.api.nvim_get_hl(0, { name = "lualine_a_normal" }).bg
    local bg_b = vim.api.nvim_get_hl(0, { name = "lualine_b_normal" }).bg
    local avg = "#" .. require("mongwell.plugins.lualine.utils").color_avg("0a0a0a",
        require("mongwell.plugins.lualine.utils").color_avg(string.format("%06x", bg_a),
                                                            string.format("%06x", bg_b)))
    vim.api.nvim_set_hl(0, "ShadowSpace", { bg = avg })
end

return M
