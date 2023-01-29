local orgmode = require("orgmode")

local templates = {
    m = {
        description = "Meeting notes",
        template = "\n* %^{PROMPT|Meeting|LOGGING WGM} %U \n\t- %?"
    },
    t = {
        description = 'Task', template = '* BACKLOG %?\n  %u'
    }
}

orgmode.setup_ts_grammar()
orgmode.setup {
    org_agenda_files = { '~/workspace/orgspace/*' },
    org_default_notes_file = '~/workspace/orgspace/refile_work.org',
    win_split_mode = "auto",

    org_todo_keywords = { "BACKLOG(b)", "BLOCKED(x)", "HOLD", "PROGRESS", "REVIEW", "DONE" },
    org_todo_keyword_faces = {
        PROGRESS = ":foreground darkcyan",
        BLOCKED  = ":foreground orange :slant italic",
        HOLD     = ":foreground yellow :slant italic",
        REVIEW   = ": foreground slateblue :slant italic",
        DONE     = ":slant italic",
    },
    org_priority_highest = 1,
    org_priority_default = 2,
    org_priority_lowest = 3,
    org_hide_emphasis_markers = true,
    org_edit_src_content_indentation = 2,

    mappings = {
        prefix = '<leader>n',
        org = {
            org_set_tags_command = 'cil',
            outline_up_heading = 't{',
        },
    },

    org_capture_templates = templates,
}
