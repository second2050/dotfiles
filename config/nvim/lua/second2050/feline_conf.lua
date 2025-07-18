local line_ok, feline = pcall(require, "feline")
if not line_ok then
    return
end

local one_monokai = {
    fg = "#abb2bf",
    bg = "#00000000", --"#1e2024",
    green = "#98c379",
    yellow = "#e5c07b",
    purple = "#c678dd",
    orange = "#d19a66",
    peanut = "#f6d5a4",
    red = "#e06c75",
    aqua = "#61afef",
    darkblue = "#282c34",
    dark_red = "#f75f5f",
}

local vi_mode_colors = {
    NORMAL = "green",
    OP = "green",
    INSERT = "yellow",
    VISUAL = "purple",
    LINES = "orange",
    BLOCK = "dark_red",
    REPLACE = "red",
    COMMAND = "aqua",
}

local c = {
    vim_mode = {
        provider = {
            name = "vi_mode",
            opts = {
                show_mode_name = true,
                -- padding = "center", -- Uncomment for extra padding.
            },
        },
        hl = function()
            return {
                fg = require("feline.providers.vi_mode").get_mode_color(),
                bg = "bg",
                style = "bold",
                name = "NeovimModeHLColor",
            }
        end,
        left_sep = "",
        right_sep = " ",
    },
    gitBranch = {
        provider = "git_branch",
        hl = {
            fg = "peanut",
            bg = "bg",
            style = "bold",
        },
        left_sep = " ",
        right_sep = "",
    },
    gitDiffAdded = {
        provider = "git_diff_added",
        hl = {
            fg = "green",
            bg = "bg",
        },
        left_sep = " ",
        right_sep = "",
    },
    gitDiffRemoved = {
        provider = "git_diff_removed",
        hl = {
            fg = "red",
            bg = "bg",
        },
        left_sep = " ",
        right_sep = "",
    },
    gitDiffChanged = {
        provider = "git_diff_changed",
        hl = {
            fg = "fg",
            bg = "bg",
        },
        left_sep = " ",
        right_sep = "",
    },
    separator = {
        provider = "",
    },
    fileinfo = {
        provider = {
            name = "file_info",
            opts = {
                type = "relative-short",
            },
        },
        hl = {
            style = "bold",
        },
        left_sep = " ",
        right_sep = " ",
    },
    breadcrumbs = {
        provider = function()
            return navic.get_location()
        end,
        enabled = function()
            return navic.is_available()
        end,
        left_sep = "<U+E0BD>"
    },
    diagnostic_errors = {
        provider = "diagnostic_errors",
        hl = {
            fg = "red",
        },
    },
    diagnostic_warnings = {
        provider = "diagnostic_warnings",
        hl = {
            fg = "yellow",
        },
    },
    diagnostic_hints = {
        provider = "diagnostic_hints",
        hl = {
            fg = "aqua",
        },
    },
    diagnostic_info = {
        provider = "diagnostic_info",
    },
    lsp_client_names = {
        provider = "lsp_client_names",
        hl = {
            fg = "purple",
            bg = "bg",
            style = "bold",
        },
        left_sep = " ",
        right_sep = " ",
    },
    file_type = {
        provider = {
            name = "file_type",
            opts = {
                filetype_icon = true,
                case = "titlecase",
            },
        },
        hl = {
            fg = "red",
            bg = "bg",
            style = "bold",
        },
        left_sep = " ",
        right_sep = " ",
    },
    file_encoding = {
        provider = "file_encoding",
        hl = {
            fg = "orange",
            bg = "bg",
            style = "italic",
        },
        left_sep = " ",
        right_sep = " ",
    },
    position = {
        provider = "position",
        hl = {
            fg = "green",
            bg = "bg",
            style = "bold",
        },
        left_sep = " ",
        right_sep = " ",
    },
    line_percentage = {
        provider = "line_percentage",
        hl = {
            fg = "aqua",
            bg = "bg",
            style = "bold",
        },
        left_sep = " ",
        right_sep = "",
    },
    scroll_bar = {
        provider = "scroll_bar",
        hl = {
            fg = "yellow",
            style = "bold",
        },
    },
}

local left = {
    c.vim_mode,
    c.gitBranch,
    c.gitDiffAdded,
    c.gitDiffRemoved,
    c.gitDiffChanged,
    c.separator,
}

local middle = {
    c.diagnostic_errors,
    c.diagnostic_warnings,
    c.diagnostic_info,
    c.diagnostic_hints,
}

local right = {
    c.fileinfo,
    c.lsp_client_names,
    c.file_type,
    c.file_encoding,
    c.position,
    c.line_percentage,
    -- c.scroll_bar,
}

return {
    bottom_bar = {
        components = {
            active = {
                left,
                middle,
                right,
            },
            inactive = {
                left,
                middle,
                right,
            },
        },
        theme = one_monokai,
        vi_mode_colors = vi_mode_colors,
    },
    top_bar = {
        components = {
            active = {
                c.fileinfo
                --c.breadcrumbs
            },
            inactive = {
                c.fileinfo
            }
        },
        theme = one_monokai
    }
}

