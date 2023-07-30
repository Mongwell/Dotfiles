local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
    return
end

project.setup({
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { "=orgspace" },
    exclude_dirs = {},
})

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end
telescope.load_extension("projects")
