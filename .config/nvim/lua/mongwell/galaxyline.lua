local status_ok, gl = pcall(require, "galaxyline")
if not status_ok then
    return
end

local gls = gl.section

gl.short_line_list = { 'NvimTree', 'fugitive', 'fugitiveblame' }

local colors = {
    bg = "#282c34",
    line_bg = "#353644",
    fg = '#8FBCBB',

    yellow = '#fabd2f',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#afd700',
    orange = '#FF8800',
    purple = '#5d4d7a',
    magenta = '#c678dd',
    blue = '#51afef';
    red = '#ec5f67'
}

local mode_color = function()
    local mode_colors = {
        n = colors.blue,
        c = colors.yellow,
        i = colors.green,
        v = colors.magenta,
        [''] = colors.magenta,
        V = colors.magenta,
        R = colors.red,
        t = colors.cyan,
    }
    return mode_colors[vim.fn.mode()]
end

local function buffer_not_empty()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return ' '
    else
        return nil
    end
end

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    return (squeeze_width > 40)
end

local function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

-- Left Side
gls.left[1] = {
    FirstElement = {
        provider = function() return '▋' end,
        highlight = { colors.cyan, colors.line_bg }
    }
}

gls.left[2] = {
    ViMode = {
        provider = function()
            local alias = {
                n     = 'NORMAL',
                i     = 'INSERT',
                c     = 'COMMAND',
                V     = 'VISUAL LINE',
                [''] = 'VISUAL BLOCK',
                v     = 'VISUAL',
                R     = 'REPLACE',
                s     = 'SELECT',
                S     = 'SELECT',
                t     = 'TERMINAL',
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color())
            return alias[vim.fn.mode()] .. '   '
        end,
        highlight = { colors.line_bg, colors.line_bg, 'bold' },
        separator = "",
        separator_highlight = { colors.line_bg, colors.bg }
    }
}

gls.left[3] = {
    FileName = {
        provider = { 'FileName', 'FileSize' },
        condition = buffer_not_empty,
        highlight = { colors.fg, colors.bg, 'bold' },
        separator = " ",
        separator_highlight = { colors.bg, colors.line_bg },
    }
}

gls.left[4] = {
    GitIcon = {
        provider = function() return ' ' end,
        condition = buffer_not_empty,
        highlight = { colors.red, colors.line_bg },

    }
}

gls.left[5] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = buffer_not_empty,
        highlight = { colors.yellow, colors.line_bg, 'bold' },
    }
}

gls.left[6] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = '   ',
        highlight = { colors.green, colors.line_bg },
    }
}

gls.left[7] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = '   ',
        highlight = { colors.orange, colors.line_bg },
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = '   ',
        highlight = { colors.red, colors.line_bg },
    }
}

gls.left[9] = {
    LeftEnd =
    {
        provider = function() return '' end,
        condition = buffer_not_empty,
        separator_highlight = { colors.line_bg, colors.bg },
        highlight = { colors.line_bg, colors.bg }
    }
}

gls.left[10] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '   ',
        highlight = { colors.red, colors.bg }
    }
}

gls.left[11] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '   ',
        highlight = { colors.yellow, colors.bg }
    }
}

gls.left[12] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '   ',
        highlight = { colors.blue, colors.bg },
    }
}

gls.left[13] = {
    TrailingWhitespace = {
        provider = trailing_whitespace,
        icon = '   ',
        highlight = { colors.yellow, colors.bg },
    }
}

-- Right Side
gls.right[1] = {
    RightLeadingSpace = {
        provider = function() return ' ' end,
        highlight = { colors.line_bg, colors.line_bg },
        separator = '',
        separator_highlight = { colors.line_bg, colors.bg }
    }
}

gls.right[2] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color,
            colors.line_bg }
    }
}

gls.right[3] = {
    FileFormat = {
        provider = function() return vim.bo.filetype end,
        highlight = { colors.fg, colors.line_bg, 'bold' }
    }
}

gls.right[4] = {
    LineInfo = {
        provider = 'LineColumn',
        highlight = { colors.fg, colors.line_bg },
        separator = ' |',
        separator_highlight = { colors.bg, colors.line_bg, 'bold' }
    }
}

gls.right[5] = {
    LinePercent = {
        provider = 'LinePercent',
        highlight = { colors.fg, colors.line_bg },
        separator = ' |',
        separator_highlight = { colors.bg, colors.line_bg, 'bold' }
    }
}

-- Short Line
gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = has_file_type,
        highlight = { colors.fg, colors.line_bg },
        separator = '',
        separator_highlight = { colors.line_bg, colors.bg },
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = 'BufferIcon',
        condition = has_file_type,
        highlight = { colors.fg, colors.line_bg },
        separator = '',
        separator_highlight = { colors.line_bg, colors.bg }
    }
}
