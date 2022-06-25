local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

autopairs.setup {
    disable_filetype = { "TelescopePrompt" },
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
    }
}

-- Add parentheses on when completing a function with cmp
local cmp_apairs_status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_apairs_status_ok then
    return
end
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
)