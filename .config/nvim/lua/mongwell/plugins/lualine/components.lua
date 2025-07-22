M = {}

local function servers()
    local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
    if #buf_clients == 0 then
        return ""
    end

    -- add client
    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" and client.name ~= "copilot" then
            table.insert(buf_client_names, client.name)
        end
    end

    local unique_client_names = table.concat(buf_client_names, ", ")
    local language_servers = string.format("%s", unique_client_names)
    return language_servers
end

M.lualine_sections = function(sep_l, sep_r)
    return {
        lualine_a = {
            function()
                return ""
            end,
            {
                'mode',
                padding = 0,
                color = { gui = 'bold' },
                separator = { right = sep_l },
            },
            {
                "",
                draw_empty = true,
                padding = 0,
                -- color = { bg = "#424242" },
                color = "ShadowSpace",
                separator = { right = sep_l },
                cond = function()
                    local hl = vim.api.nvim_get_hl(0, { name = "ShadowSpace" })
                    return next(hl) ~= nil
                end
            },
        },

        -- lualine_b = {{ function () return '' end, draw_empty = true }},
        lualine_b = {
            {
                "filetype",
                colored = true,
                icon_only = true,
                icon = { align = 'right' },
                padding = { left = 1, right = 0 },
            },
            {
                "filename",
                symbols = {
                    modified = " ",
                    -- modified = "",
                    -- readonly = "",
                    readonly = "󰍁",
                },
            },

            {
                "filesize",
                padding = 0,
            },
        },

        lualine_c = {
            {
                "branch",
                icon = {
                    -- "",
                    "󰘬",
                    align = "left",
                    color = { fg = "#e8ab53" }
                },
            },
            {
                "diff",
                symbols = {
                    -- added = " ",
                    -- modified = " ",
                    -- removed = " ",
                    added = " ",
                    modified = " ",
                    removed = " ",
                }

            },
        },

        lualine_x = {
            {
                "searchcount",
                padding = { left = 0, right = 1 },
            },
            {
                "selectioncount",
                padding = { left = 0, right = 1 },
            },
            {
                "diagnostics",
                padding = { left = 0 },
            },
            {
                servers,
            }
        },

        lualine_y = {
            {
                "location",
                padding = 0,
            }
        },

        lualine_z = {
            {
                "progress"
            }
        },
    }
end

return M
