local project_opts = {
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { "=orgspace" },
    exclude_dirs = {},
}

return {
    "ahmedkhalf/project.nvim",
    opts = project_opts,
    main = "project_nvim",
    event = "VimEnter",
    cmd = "Telescope projects",
}
