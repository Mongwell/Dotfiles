local surround_opts = {
    highlight_duration = 1500,
    n_lines = 50,
}

return {
    "echasnovski/mini.surround",
    lazy = false,   -- plugin is so small, not worth it to lazy load
    opts = surround_opts,
}
