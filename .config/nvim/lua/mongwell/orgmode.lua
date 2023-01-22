local orgmode_ok, orgmode = pcall(require, "orgmode")
if not orgmode_ok then
    return
end

orgmode.setup_ts_grammar()
orgmode.setup {

}

local bullets_ok, bullets = pcall(require, "org-bullets")
if not bullets_ok then
    return
end

bullets.setup {

}

local headlines_ok, headlines = pcall(require, "headlines")
if not headlines_ok then
    return
end

headlines.setup {

}
