local status_ok, tscontext = pcall(require, "treesitter-context")
if not status_ok then
    return
end

tscontext.setup {
    enable = true,
    max_lines = 0,
    separator = nil,
    patterns = {
        default = {
            -- 'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
        },
        markdown = {
            'section'
        },
        json = {
            'pair',
        },
        yaml = {
            'bloc_mapping_pair',
        },
    },
}
