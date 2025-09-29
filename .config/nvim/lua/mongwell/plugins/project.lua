local project_opts = {
    show_hidden = true,
}

return {
    "ahmedkhalf/project.nvim",
    opts = project_opts,
    main = "project_nvim",
    event = "VimEnter",
    cmd = "Telescope projects",
}
