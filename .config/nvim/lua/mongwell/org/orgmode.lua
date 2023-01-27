orgmode = require("orgmode")

templates = {
    m = {
        description = "Meeting notes",
        template = "\n*** %^{PROMPT|Meeting|LOGGING WGM} %U \n - %?"
    },
}

orgmode.setup_ts_grammar()
orgmode.setup {
    mappings = {
        prefix = '<leader>n',
        org = {
            org_refile = '<Nop>'
        },
        capture = {
            org_capture_refile = '<Nop>'
        }
    },

    org_capture_templates = templates
}
