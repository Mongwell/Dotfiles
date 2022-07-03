local status_ok, minisurround = pcall(require, "mini.surround")
if not status_ok then
    return
end

minisurround.setup {
    custom_surroundings = nil,
    highlight_duration = 1500,
    mappings = {
        add = 'sa',
        delete = 'sd',
        find = 'sf',
        find_left = 'sF',
        highlight = 'sh',
        replace = 'sr',
        update_n_lines = 'sn',
    },
    n_lines = 50,
    search_method = 'cover',
}
